Content-Type: multipart/mixed; boundary="===============5702605554096756218=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi, block] 0dba1314d4: WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup
Date: Mon, 06 Feb 2017 10:02:49 +0800
Message-ID: <20170206020249.GL12121@yexl-desktop>
In-Reply-To: <CAPcyv4jJ38yJz5=GtVdRxR_ARWAftZP62_dd+RGbH9_95R3y5A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5702605554096756218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/05, Dan Williams wrote:
>On Sun, Feb 5, 2017 at 4:57 PM, Ye Xiaolong <xiaolong.ye@intel.com> wrot=
e:
>> On 02/05, Dan Williams wrote:
>>>On Fri, Feb 3, 2017 at 11:09 PM, kernel test robot
>>><xiaolong.ye@intel.com> wrote:
>>>>
>>>> FYI, we noticed the following commit:
>>>>
>>>> commit: 0dba1314d4f81115dce711292ec7981d17231064 ("scsi, block: fix du=
plicate bdi name registration crashes")
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git =
for-4.11/next
>>>>
>>>> in testcase: boot
>>>>
>>>> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap=
 -m 360M
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>>>[..]
>>>> To reproduce:
>>>>
>>>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lk=
p-tests.git
>>>>         cd lkp-tests
>>>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached=
 in this email
>>>
>>>I tried this on a Fedora 24 system but was unsuccessful. Does it need
>>>to be run as root?
>>
>> No, It doesn't need root privilege, could you paste some log for me to c=
heck?
>>
>
>Attached is the output from:
>
>./bin/lkp qemu -k ~/git/linux/arch/x86/boot/bzImage job-script >out 2>&1
>

Hmm, I believe it was caused by job-script saved as dos format, I can repro=
duce
it when I downloaded it through outlook attachment.

Try `dos2unix job-script` before "lkp qemu" to see whether it works.

Thanks,
Xiaolong

>Top lkp commit is:
>
>0f9182f8eced jobs/ltp.yaml: enable some stress test groups

>job-script: line 2: $'\r': command not found
>job-script: line 3: syntax error near unexpected token `$'\r''
>job-script: line 3: `export_top_env()
'
>make: Entering directory '/home/dwillia2/git/lkp-tests/bin/event'
>klcc    -c -o wakeup.o wakeup.c
>make: klcc: Command not found
><builtin>: recipe for target 'wakeup.o' failed
>make: *** [wakeup.o] Error 127
>make: Leaving directory '/home/dwillia2/git/lkp-tests/bin/event'
>mv: cannot stat '/home/dwillia2/.lkp/cache/lkp-x86_64.cgz': No such file o=
r directory
>cpio: lkp: Cannot stat: No such file or directory
>cpio: lkp/scheduled: Cannot stat: No such file or directory
>cpio: blank line ignored
>find: =E2=80=98/boot/efi=E2=80=99: Permission denied
>find: =E2=80=98/boot/lost+found=E2=80=99: Permission denied
>cpio: /boot/System.map-4.8.8-100.fc23.x86_64: Cannot open: Permission deni=
ed
>find: =E2=80=98/etc/pki/CA/private=E2=80=99: Permission denied
>find: =E2=80=98/etc/pki/rsyslog=E2=80=99: Permission denied
>find: =E2=80=98/etc/pki/pesign=E2=80=99: Permission denied
>find: =E2=80=98/etc/selinux/targeted/modules/active=E2=80=99: Permission d=
enied
>find: =E2=80=98/etc/liboath=E2=80=99: Permission denied
>cpio: /boot/initrd-4.0.0-rc6_pmem_36+.img: Cannot open: Permission denied
>cpio: /boot/System.map-4.8.8-200.fc24.x86_64: Cannot open: Permission deni=
ed
>cpio: /boot/System.map-4.8.10-200.fc24.x86_64: Cannot open: Permission den=
ied
>cpio: /boot/initramfs-4.8.10-200.fc24.x86_64.img: Cannot open: Permission =
denied
>cpio: /boot/initramfs-4.0.0-rc6_pmem_36+.img: Cannot open: Permission deni=
ed
>cpio: /boot/initramfs-0-rescue-74b1c68ce054405d96e6240808cf80e6.img: Canno=
t open: Permission denied
>cpio: /boot/initramfs-4.8.8-200.fc24.x86_64.img: Cannot open: Permission d=
enied
>find: =E2=80=98/etc/polkit-1/rules.d=E2=80=99: Permission denied
>find: =E2=80=98/etc/polkit-1/localauthority=E2=80=99: Permission denied
>cpio: /dev/shm/pulse-shm-3253467294: Cannot open: Permission denied
>cpio: /dev/shm/pulse-shm-3606706860: Cannot open: Permission denied
>cpio: /dev/shm/pulse-shm-1147769129: Cannot open: Permission denied
>cpio: /dev/shm/pulse-shm-4019948134: Cannot open: Permission denied
>cpio: /dev/shm/pulse-shm-1465221471: Cannot open: Permission denied
>cpio: /etc/crypttab: Cannot open: Permission denied
>find: =E2=80=98/etc/lvm/archive=E2=80=99: Permission denied
>find: =E2=80=98/etc/lvm/backup=E2=80=99: Permission denied
>find: =E2=80=98/etc/lvm/cache=E2=80=99: Permission denied
>find: =E2=80=98/etc/audisp=E2=80=99: Permission denied
>find: =E2=80=98/etc/audit=E2=80=99: Permission denied
>find: =E2=80=98/etc/grub.d=E2=80=99: Permission denied
>find: =E2=80=98/etc/firewalld=E2=80=99: Permission denied
>find: =E2=80=98/etc/ipsec.d=E2=80=99: Permission denied
>find: =E2=80=98/etc/ssmtp=E2=80=99: Permission denied
>find: =E2=80=98/etc/cups/ssl=E2=80=99: Permission denied
>find: =E2=80=98/etc/sssd=E2=80=99: Permission denied
>find: =E2=80=98/etc/dhcp=E2=80=99: Permission denied
>find: =E2=80=98/etc/libvirt=E2=80=99: Permission denied
>find: =E2=80=98/etc/vmware-tools/GuestProxyData/trusted=E2=80=99: Permissi=
on denied
>find: =E2=80=98/etc/sudoers.d=E2=80=99: Permission denied
>find: =E2=80=98/etc/ntp/crypto=E2=80=99: Permission denied
>cpio: /etc/sysconfig/ip6tables-config: Cannot open: Permission denied
>cpio: /etc/sysconfig/iptables-config: Cannot open: Permission denied
>cpio: /etc/sysconfig/ebtables-config: Cannot open: Permission denied
>cpio: /etc/sysconfig/sshd: Cannot open: Permission denied
>cpio: /etc/sysconfig/ip6tables: Cannot open: Permission denied
>cpio: /etc/sysconfig/iptables: Cannot open: Permission denied
>cpio: /etc/vpnc/default.conf: Cannot open: Permission denied
>cpio: /etc/openldap/certs/password: Cannot open: Permission denied
>cpio: /etc/security/opasswd: Cannot open: Permission denied
>cpio: /etc/.pwd.lock: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/arcor: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/avm: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/avm-ml: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/leased: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/otelo: Cannot open: Permission denied
>cpio: /etc/ppp/peers/isdn/talkline: Cannot open: Permission denied
>cpio: /etc/ppp/peers/wvdial: Cannot open: Permission denied
>cpio: /etc/ppp/chap-secrets: Cannot open: Permission denied
>cpio: /etc/ppp/pap-secrets: Cannot open: Permission denied
>cpio: /etc/ppp/eaptls-client: Cannot open: Permission denied
>cpio: /etc/ppp/eaptls-server: Cannot open: Permission denied
>cpio: /etc/ppp/chap-secrets.sample: Cannot open: Permission denied
>cpio: /etc/iscsi/iscsid.conf: Cannot open: Permission denied
>cpio: /etc/ssh/ssh_host_rsa_key: Cannot open: Permission denied
>cpio: /etc/ssh/ssh_host_ecdsa_key: Cannot open: Permission denied
>cpio: /etc/ssh/sshd_config: Cannot open: Permission denied
>cpio: /etc/ssh/ssh_host_ed25519_key: Cannot open: Permission denied
>cpio: /etc/ssh/sshd_config.rpmnew: Cannot open: Permission denied
>cpio: /etc/wpa_supplicant/wpa_supplicant.conf: Cannot open: Permission den=
ied
>cpio: /etc/brlapi.key: Cannot open: Permission denied
>cpio: /etc/cups/subscriptions.conf.O: Cannot open: Permission denied
>cpio: /etc/cups/subscriptions.conf: Cannot open: Permission denied
>cpio: /etc/cups/classes.conf: Cannot open: Permission denied
>cpio: /etc/cups/cups-files.conf.default: Cannot open: Permission denied
>cpio: /etc/cups/cupsd.conf: Cannot open: Permission denied
>cpio: /etc/cups/cupsd.conf.default: Cannot open: Permission denied
>cpio: /etc/cups/printers.conf: Cannot open: Permission denied
>cpio: /etc/cups/snmp.conf.default: Cannot open: Permission denied
>cpio: /etc/cups/cups-files.conf: Cannot open: Permission denied
>cpio: /etc/xl2tpd/l2tp-secrets: Cannot open: Permission denied
>cpio: /etc/vmware-tools/GuestProxyData/server/key.pem: Cannot open: Permis=
sion denied
>cpio: /etc/isdn/vboxd.conf: Cannot open: Permission denied
>cpio: /etc/isdn/vboxgetty.conf: Cannot open: Permission denied
>cpio: /etc/chrony.keys: Cannot open: Permission denied
>cpio: /etc/ntp/keys: Cannot open: Permission denied
>cpio: /etc/krb5.keytab: Cannot open: Permission denied
>cpio: /etc/gssproxy/24-nfs-server.conf: Cannot open: Permission denied
>cpio: /etc/gssproxy/99-nfs-client.conf: Cannot open: Permission denied
>cpio: /etc/gssproxy/gssproxy.conf: Cannot open: Permission denied
>cpio: /etc/pesign/groups: Cannot open: Permission denied
>cpio: /etc/pesign/users: Cannot open: Permission denied
>cpio: /etc/chrony.keys.rpmnew: Cannot open: Permission denied
>cpio: /etc/libaudit.conf: Cannot open: Permission denied
>cpio: /etc/ipsec.secrets: Cannot open: Permission denied
>cpio: /etc/sudoers: Cannot open: Permission denied
>cpio: /etc/tcsd.conf: Cannot open: Permission denied
>cpio: /etc/gshadow-: Cannot open: Permission denied
>cpio: /etc/shadow-: Cannot open: Permission denied
>cpio: /etc/gshadow: Cannot open: Permission denied
>cpio: /etc/shadow: Cannot open: Permission denied


--===============5702605554096756218==--

