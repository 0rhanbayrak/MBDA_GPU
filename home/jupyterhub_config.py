c = get_config()

c.JupyterHub.authenticator_class = 'native'

import os, nativeauthenticator
c.JupyterHub.template_paths = [f"{os.path.dirname(nativeauthenticator.__file__)}/templates/"]

c.Authenticator.admin_users = {'orhan', 'codaslab'}
c.Authenticator.whitelist = {'orhan', 'codaslab'}
c.Authenticator.allow_all = True
c.Authenticator.open_signup = True

c.NativeAuthenticator.confirm_new_users = False
c.NativeAuthenticator.create_system_users = True

c.JupyterHub.concurrent_spawn_limit = 4

import pwd, subprocess

def pre_spawn_hook(spawner):
    username = spawner.user.name
    user_home = f"/home/{username}"
    example_prefed_src = "/home/example_prefed"
    example_prefed_dst = f"{user_home}/example_prefed"

    try:
        pwd.getpwnam(username)
    except KeyError:
        try:
            subprocess.run(['groupadd', '-f', 'mbda'], check=True)
            subprocess.check_call(['useradd', '-m', '-s', '/bin/bash', '-g', 'mbda', username])
            subprocess.run(['chmod', '700', user_home], check=True)

            if os.path.exists(example_prefed_src):
                subprocess.run(['cp', '-r', example_prefed_src, example_prefed_dst], check=True)
                subprocess.run(['chown', '-R', f'{username}:mbda', example_prefed_dst], check=True)

            for tool in ['MEDA-Toolbox', 'FCParser', 'UGR-16']:
                source = f"/{tool}"
                target = f"{user_home}/{tool}"
                if os.path.exists(source) and not os.path.exists(target):
                    subprocess.run(['ln', '-s', source, target], check=True)

        except subprocess.CalledProcessError as e:
            spawner.log.error(f"User creation failed for {username}: {e}")

c.Spawner.pre_spawn_hook = pre_spawn_hook
