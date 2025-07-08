---
- name: Restart Teleport
  ansible.builtin.systemd:
    name: teleport
    state: restarted
