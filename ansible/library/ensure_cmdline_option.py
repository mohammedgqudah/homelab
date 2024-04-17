#!/usr/bin/python

DOCUMENTATION = r"""
module: ensure_cmdline_option

short_description: This module is responsible for adding options to cmdline.txt on rasbperry pi.

options:
    path:
        description: path to the cmdline.txt (/boot/firmweare/cmdline.txt)
        required: true
        type: str
    option:
        description: the cmdline option name
        required: true
        type: str
    value:
        description: the option value
        required: true
        type: str
author:
    - Mohammed Qudah (@mohammedgqudah)
"""
EXAMPLES = r'''
- name: Ensure cgroup_memory=1 option is present
  ensure_cmdline_option:
    path: /boot/firmware/cmdline.txt
    option: cgroup_memory
    value: 1
'''

from ansible.module_utils.basic import AnsibleModule

def ensure_option(path, option, value):
    # options are in this format: key=value
    option_to_add = f"{option}={value}"
    try:
        with open(path, 'r') as file:
            # cmdline.txt is expected to be a single line
            line = file.read().strip()

        if option_to_add not in line:
            with open(path, 'w') as file:
                # add the option to the existing line
                file.write(f"{line} {option_to_add}\n")

            return True, f"Added '{option_to_add}' to '{path}'"
        else:
            return False, f"'{option_to_add}' already present in {path}"
    except FileNotFoundError:
        return False, "File '{}' not found".format(path)


def main():
    module_args = dict(
        path=dict(type='str', required=True),
        option=dict(type='str', required=True),
        value=dict(type='str', required=True),
    )

    module = AnsibleModule(
        argument_spec=module_args,
    )

    is_changed, msg = ensure_option(**module.params)

    module.exit_json(changed=is_changed, msg=msg)

if __name__ == '__main__':
    main()

