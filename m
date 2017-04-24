Content-Type: multipart/mixed; boundary="===============3192647696382329567=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [debugfs] f3e7155d08: BUG:unable_to_handle_kernel
Date: Mon, 24 Apr 2017 14:36:15 +0800
Message-ID: <20170424063615.GA15491@yexl-desktop>
In-Reply-To: <871ssj3r8l.fsf@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3192647696382329567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/23, Nicolai Stange wrote:
>Hi Xiaolong,
>
>I'm encountering some difficulties running the reproducer, see below.
>Any help is very welcome!
>

Thanks for watching the report and trying the reproducer.

>
>On Tue, Apr 18 2017, kernel test robot wrote:
>
>> [   45.772683] BUG: unable to handle kernel NULL pointer dereference at =
0000000000000010
><snip>
>> [   45.772697] IP: __debugfs_remove+0x5c/0xc0
>> [   45.772743] Call Trace:
>> [   45.772750]  debugfs_remove_recursive+0xd4/0x1e0
>> [   45.772758]  rpc_clnt_debugfs_unregister+0x19/0x30
>> [   45.772762]  rpc_client_register+0x18a/0x1c0
>> [   45.772765]  rpc_new_client+0x1de/0x2e0
>> [   45.772768]  rpc_create_xprt+0x58/0x170
>> [   45.772769]  rpc_create+0xea/0x1c0
>> [   45.772776]  nfs_create_rpc_client+0xe8/0x130
>> [   45.772814]  nfs4_init_client+0x7e/0x290 [nfsv4]
>> [   45.772820]  ? __radix_tree_replace+0x8a/0x140
>> [   45.772823]  ? radix_tree_iter_tag_clear+0x1c/0x20
>> [   45.772827]  ? __rpc_init_priority_wait_queue+0x81/0xb0
>> [   45.772830]  ? rpc_init_wait_queue+0x13/0x20
>> [   45.772847]  ? nfs4_alloc_client+0x1d2/0x1e0 [nfsv4]
><snip>
>> [ 45.772985] Code: 8b 7c 24 30 48 89 de e8 f3 28 e6 ff 48 89 df e8 3b
>> 22 e5 ff 4c 8b 63 78 48 c7 c2 20 d7 3b 82 48 c7 c6 e0 9f c9 81 49 8d
>> 7c 24 18 <41> c7 44 24 10 00 00 00 00 4d 8d 6c 24 10 e8 a1 b6 cc ff 49
>> 8d
>
>Ok, that's
>
>	41 c7 44 24 10 00 00 	movl   $0x0,0x10(%r12)
>
>which is probably the init_completion() in __debugfs_remove_file():
>
>	fsd =3D dentry->d_fsdata;
>	init_completion(&fsd->active_users_drained);
>
>This would mean that fsd =3D=3D NULL and this can happen only if the dentry
>in question isn't a regular file but a symlink or whatever. So, an
>additional d_is_reg() is needed here. I'll fix this in the next
>iteration once I got the reproducer working.
>
>
>> To reproduce:
>>
>>         git clone https://github.com/01org/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
>>
>
>This gives
>
>  make: Entering directory '/home/nic/lkp-tests/bin/event'
>  gcc    -c -o wakeup.o wakeup.c
>  gcc   -o wakeup wakeup.o
>  rm -f wakeup.o
>  strip wakeup
>  make: Leaving directory '/home/nic/lkp-tests/bin/event'
>  cpio: root:lkp: invalid group
>  cpio: root:lkp: invalid group
>  cpio: root:lkp: invalid group
>  gzip: /home/nic/.lkp/cache/lkp-x86_64.cpio: No such file or directory
>  mv: cannot stat =E2=80=98/home/nic/.lkp/cache/lkp-x86_64.cpio.gz=E2=80=
=99: No such file or directory
>  mv: cannot stat =E2=80=98/home/nic/.lkp/cache/lkp-x86_64.cgz=E2=80=99: N=
o such file or directory
>  result_root: /home/nic/.lkp//result/boot/1/vm-lkp-nex04-8G/debian-x86_64=
-2016-08-31.cgz/x86_64-rhel-7.2/gcc-6/f3e7155d085591ab58f0993ce633fea58c082=
b35/3
>  downloading initrds ...
>  /usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretr=
y 1000 --tries 1000 https://github.com/0day-ci/lkp-qemu/raw/master/osimage/=
debian/debian-x86_64-2016-08-31.cgz -N -P /home/nic/.lkp/cache/osimage/debi=
an
>  /usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretr=
y 1000 --tries 1000 https://github.com/0day-ci/lkp-qemu/raw/master/osimage/=
deps/debian-x86_64-2016-08-31.cgz/lkp_2017-04-01.cgz -N -P /home/nic/.lkp/c=
ache/osimage/deps/debian-x86_64-2016-08-31.cgz
>  Failed to download osimage/deps/debian-x86_64-2016-08-31.cgz/lkp_2017-04=
-01.cgz
>
>Manual download of that very last lkp_2017-04-01.cgz file results in a 404
>error. Please let me know if you need more details.

It's most likely we haven't upload the lkp_2017-04-01.cgz file to github.
I'll check it and get back to you later.

Thanks,
Xiaolong
>
>
>Thank you!
>
>Nicolai

--===============3192647696382329567==--

