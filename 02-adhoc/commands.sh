#!/usr/bin/env sh

# ansible host-pattern -m module [-a 'module options] [-i inventory]

ansible -i vars.inv all -m ping # 대상 호스트에 연결 후 파이썬 사용가능여부 확인
ansible -i vars.inv amazon -m command -a "uptime" # 호스트들 내에서 명령어 실행

# localhost : 로컬. 호스트 제어하는 컴터
# setup : 리모트 호스트의 정보 수집하는 모듈
ansible localhost -m setup
ansible localhost -m setup -a "filter=ansible_dist*"

# apt : 패키지 관리하는 모듈
# --become : 사용자 전환을 위한 옵션. 권한 실패시 사용.
ansible -i vars.inv -m apt -a "name=git state=latest update_cache=yes" ubuntu
ansible -i vars.inv -m apt -a "name=git state=latest update_cache=yes" ubuntu --become
ansible -i vars.inv -m apt -a "name=git state=absent update_cache=yes" ubuntu --become