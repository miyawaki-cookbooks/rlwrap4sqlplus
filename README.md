rlwrap4sqlplus Cookbook
=======================
SQL*Plus��readline�@�\��ǉ�����B

���̏������s���B
* EPEL���|�W�g�����C���X�g�[��
* rlwrap���C���X�g�[��
* LOGIN SHELL��ksh�Ȃ�΁A~oracle/.profile��sqlplus�̃G�C���A�X��ǉ�
* LOGIN SHELL��bash�Ȃ�΁A~oracle/.bash_profile��sqlplus�̃G�C���A�X��ǉ�

Requirements
------------
CentOS6.6�ɂē���m�F�����Ă��܂��B

* oracle���[�U���쐬����Ă��邱�ƁB
* sqlplus�R�}���h���C���X�g�[������Ă��邱�ƁB(MUST�ł͂Ȃ����A�Ӗ����Ȃ��j

#### �ˑ��p�b�P�[�W
* `yum`

Barksfile��yum��ǉ����Ă��������B

e.g.

	source "https://supermarket.getchef.com"
	
	cookbook "oracle"
	cookbook "yum"

Attributes
----------
�Ȃ�

Usage
-----
run_list�ɕK�v��Cookbook�ƂƂ��ɋL�q����B

	run_list "recipe[oracle]",
	         "recipe[oracle::logrotate_alert_log]",
	         "recipe[oracle::logrotate_listener]",
	         "recipe[oracle::createdb]",
	         "recipe[rlwrap4sqlplus]"

License and Authors
-------------------
Authors:: YAMAMOTO,Miyawaki,Tamie.
