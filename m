Content-Type: multipart/mixed; boundary="===============0630656987920126384=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [compat_ioctl] 97ca70e16d: mdadm-selftests.enchmarks/mdadm-selftests/tests/06name.fail
Date: Mon, 05 Aug 2019 16:53:54 +0800
Message-ID: <a5d196c0-87be-dbbd-90f6-5de3dfe547cd@intel.com>
In-Reply-To: <CAK8P3a02URMNkQfckV4yY+xERjBetzzmVW9suzvm1B3WE5NkgA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0630656987920126384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 7/29/19 7:48 PM, Arnd Bergmann wrote:
> On Mon, Jul 29, 2019 at 11:47 AM kernel test robot
> <rong.a.chen@intel.com> wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: 97ca70e16dc76bad69ad774cf0bd0286c97d63b4 ("compat_ioctl: scsi: m=
ove ioctl handling into drivers")
>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/arnd/playground=
.git to-build
>>
>> in testcase: mdadm-selftests
>> with following parameters:
>>
>>          disk: 1HDD
>>          test_prefix: 06
>>
>>
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 =
-m 4G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Thanks for the detailed report. I don't immediately see where my patch
> went wrong,
> so I tried to reproduce the steps below, and ran into multiple
> problems with the job
> script:

Hi Arnd

>
> 1. /osimage/deps/debian-x86_64-2018-04-03.cgz/mdadm-selftests_2019-06-26.=
cgz
> could not be found on the server. I tried replacing it with
> mdadm-selftests_2019-04-29.cgz,
> which seems to be the latest version on in that directory.

Some files were missing on our server previously, i have already uploaded t=
hem.


>
> 2. -cpu SandyBridge did not work for me, as I'm on an AMD machine.
> I used "-cpu host" instead.

Good catch, but '-cpu SandyBridge' described on job-script will not really =
be passed to QEMU
Actually we don't pass any '-cpu xxx' to QEMU, so the QEMU default platform=
 will be used.


for below 3 issues, could you paste more details about them

i have already reproduced "mdadm-selftests.enchmarks/mdadm-selftests/tests/=
06name.fail"  by following the instructions described on this mail

Thanks
Zhijian

>
> 3. error "qemu: linux kernel too old to load a ram disk". I tried
> leaving out the
>    initramfs, knowing that this would finally break things if I still
> had a chance of
>    reproducing the bug at this point.
>
> 4. qemu-system-x86_64: -append root=3D/dev/ram0: Could not open
> 'user=3Dlkp': No such
>     file or directory. No idea. I tried removing this.
>
> 5. Could not open
> 'job=3D/lkp/jobs/scheduled/vm-snb-4G-55ee9590a4b9/mdadm-selftests-1HDD-06=
-debian-x86_64-2018-04-03.cgz-97ca70e16dc76ba-20190728-5974-13wd49f-3.yaml':
> That directory does not exist,
> and I could not find the file elsewhere.
>
> Any suggestions?
>
>          Arnd
>
>
>> Welcome to fdisk (util-linux 2.29.2).
>> Changes will remain in memory only, until you decide to write them.
>> Be careful before using the write command.
>>
>> Device does not contain a recognized partition table.
>> Created a new DOS disklabel with disk identifier 0x8b600b10.
>>
>> Command (m for help): Partition type
>>     p   primary (0 primary, 0 extended, 4 free)
>>     e   extended (container for logical partitions)
>> Select (default p): Partition number (1-4, default 1): First sector (204=
8-536870911, default 2048): Last sector, +sectors or +size{K,M,G,T,P} (2048=
-536870911, default 536870911):
>> Created a new partition 1 of type 'Linux' and of size 5 GiB.
>>
>> Command (m for help): The partition table has been altered.
>> Calling ioctl() to re-read partition table.
>> Syncing disks.
>>
>> 2019-07-28 07:22:06 mkdir -p /var/tmp
>> 2019-07-28 07:22:06 mke2fs -t ext3 -b 1024 -J size=3D1 -q /dev/vda1
>> 2019-07-28 07:22:08 mount -t ext3 /dev/vda1 /var/tmp
>> sed -e 's/{DEFAULT_METADATA}/1.2/g' \
>> -e 's,{MAP_PATH},/run/mdadm/map,g'  mdadm.8.in > mdadm.8
>> /usr/bin/install -D -m 644 mdadm.8 /usr/share/man/man8/mdadm.8
>> /usr/bin/install -D -m 644 mdmon.8 /usr/share/man/man8/mdmon.8
>> /usr/bin/install -D -m 644 md.4 /usr/share/man/man4/md.4
>> /usr/bin/install -D -m 644 mdadm.conf.5 /usr/share/man/man5/mdadm.conf.5
>> /usr/bin/install -D -m 644 udev-md-raid-creating.rules /lib/udev/rules.d=
/01-md-raid-creating.rules
>> /usr/bin/install -D -m 644 udev-md-raid-arrays.rules /lib/udev/rules.d/6=
3-md-raid-arrays.rules
>> /usr/bin/install -D -m 644 udev-md-raid-assembly.rules /lib/udev/rules.d=
/64-md-raid-assembly.rules
>> /usr/bin/install -D -m 644 udev-md-clustered-confirm-device.rules /lib/u=
dev/rules.d/69-md-clustered-confirm-device.rules
>> /usr/bin/install -D  -m 755 mdadm /sbin/mdadm
>> /usr/bin/install -D  -m 755 mdmon /sbin/mdmon
>> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
>> /lkp/benchmarks/mdadm-selftests/tests/06name... FAILED - see /var/tmp/06=
name.log and /var/tmp/fail06name.log for details
>> 06name TIMEOUT
>> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
>> /lkp/benchmarks/mdadm-selftests/tests/06sysfs... succeeded
>> 06sysfs TIMEOUT
>> Testing on linux-5.3.0-rc1-g97ca70e16dc76b kernel
>> /lkp/benchmarks/mdadm-selftests/tests/06wrmostly... FAILED - see /var/tm=
p/06wrmostly.log and /var/tmp/fail06wrmostly.log for details
>> 06wrmostly TIMEOUT
>>
>>
>> To reproduce:
>>
>>          # build kernel
>>          cd linux
>>          cp config-5.3.0-rc1-g97ca70e16dc76b .config
>>          make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepa=
re modules_prepare bzImage modules
>>          make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 INSTALL_MOD_PATH=
=3D<mod-install-dir> modules_install
>>          cd <mod-install-dir>
>>          find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>>
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scrip=
t is attached in this email
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============0630656987920126384==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHByZT4KPC9wcmU+CiAgICA8ZGl2IGNsYXNz
PSJtb3otY2l0ZS1wcmVmaXgiPk9uIDcvMjkvMTkgNzo0OCBQTSwgQXJuZCBCZXJnbWFubgogICAg
ICB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCmNpdGU9
Im1pZDpDQUs4UDNhMDJVUk1Oa1FmY2tWNHlZK3hFUmpCZXR6em1WVzlzdXp2bTFCM1dFNU5rZ0FA
bWFpbC5nbWFpbC5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
Pk9uIE1vbiwgSnVsIDI5LCAyMDE5IGF0IDExOjQ3IEFNIGtlcm5lbCB0ZXN0IHJvYm90CjxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyb25nLmEuY2hlbkBpbnRl
bC5jb20iPiZsdDtyb25nLmEuY2hlbkBpbnRlbC5jb20mZ3Q7PC9hPiB3cm90ZToKPC9wcmU+CiAg
ICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90
ZS1wcmUiIHdyYXA9IiI+CkZZSSwgd2Ugbm90aWNlZCB0aGUgZm9sbG93aW5nIGNvbW1pdCAoYnVp
bHQgd2l0aCBnY2MtNyk6Cgpjb21taXQ6IDk3Y2E3MGUxNmRjNzZiYWQ2OWFkNzc0Y2YwYmQwMjg2
Yzk3ZDYzYjQgKCJjb21wYXRfaW9jdGw6IHNjc2k6IG1vdmUgaW9jdGwgaGFuZGxpbmcgaW50byBk
cml2ZXJzIikKPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9r
ZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXJuZC9wbGF5
Z3JvdW5kLmdpdCI+aHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvYXJuZC9wbGF5Z3JvdW5kLmdpdDwvYT4gdG8tYnVpbGQKCmluIHRlc3RjYXNl
OiBtZGFkbS1zZWxmdGVzdHMKd2l0aCBmb2xsb3dpbmcgcGFyYW1ldGVyczoKCiAgICAgICAgZGlz
azogMUhERAogICAgICAgIHRlc3RfcHJlZml4OiAwNgoKCgpvbiB0ZXN0IG1hY2hpbmU6IHFlbXUt
c3lzdGVtLXg4Nl82NCAtZW5hYmxlLWt2bSAtY3B1IFNhbmR5QnJpZGdlIC1zbXAgMiAtbSA0RwoK
Y2F1c2VkIGJlbG93IGNoYW5nZXMgKHBsZWFzZSByZWZlciB0byBhdHRhY2hlZCBkbWVzZy9rbXNn
IGZvciBlbnRpcmUgbG9nL2JhY2t0cmFjZSk6CgoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRs
eSBhZGQgZm9sbG93aW5nIHRhZwpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJvbmcuYS5jaGVuQGludGVs
LmNvbSI+Jmx0O3JvbmcuYS5jaGVuQGludGVsLmNvbSZndDs8L2E+CjwvcHJlPgogICAgICA8L2Js
b2NrcXVvdGU+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+ClRoYW5r
cyBmb3IgdGhlIGRldGFpbGVkIHJlcG9ydC4gSSBkb24ndCBpbW1lZGlhdGVseSBzZWUgd2hlcmUg
bXkgcGF0Y2gKd2VudCB3cm9uZywKc28gSSB0cmllZCB0byByZXByb2R1Y2UgdGhlIHN0ZXBzIGJl
bG93LCBhbmQgcmFuIGludG8gbXVsdGlwbGUKcHJvYmxlbXMgd2l0aCB0aGUgam9iCnNjcmlwdDoK
PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPkhpIEFybmQKCjwvcHJlPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSIKY2l0ZT0ibWlkOkNBSzhQM2EwMlVSTU5rUWZja1Y0eVkreEVSakJldHp6bVZXOXN1enZtMUIz
V0U1TmtnQUBtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUi
IHdyYXA9IiI+CgoxLiAvb3NpbWFnZS9kZXBzL2RlYmlhbi14ODZfNjQtMjAxOC0wNC0wMy5jZ3ov
bWRhZG0tc2VsZnRlc3RzXzIwMTktMDYtMjYuY2d6CmNvdWxkIG5vdCBiZSBmb3VuZCBvbiB0aGUg
c2VydmVyLiBJIHRyaWVkIHJlcGxhY2luZyBpdCB3aXRoCm1kYWRtLXNlbGZ0ZXN0c18yMDE5LTA0
LTI5LmNneiwKd2hpY2ggc2VlbXMgdG8gYmUgdGhlIGxhdGVzdCB2ZXJzaW9uIG9uIGluIHRoYXQg
ZGlyZWN0b3J5LjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHByZT4KU29tZSBmaWxlcyB3
ZXJlIG1pc3Npbmcgb24gb3VyIHNlcnZlciBwcmV2aW91c2x5LCBpIGhhdmUgYWxyZWFkeSB1cGxv
YWRlZCB0aGVtLgoKCjwvcHJlPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlk
OkNBSzhQM2EwMlVSTU5rUWZja1Y0eVkreEVSakJldHp6bVZXOXN1enZtMUIzV0U1TmtnQUBtYWls
LmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+Cgoy
LiAtY3B1IFNhbmR5QnJpZGdlIGRpZCBub3Qgd29yayBmb3IgbWUsIGFzIEknbSBvbiBhbiBBTUQg
bWFjaGluZS4KSSB1c2VkICItY3B1IGhvc3QiIGluc3RlYWQuPC9wcmU+CiAgICA8L2Jsb2NrcXVv
dGU+CiAgICA8cHJlPkdvb2QgY2F0Y2gsIGJ1dCAnLWNwdSBTYW5keUJyaWRnZScgZGVzY3JpYmVk
IG9uIGpvYi1zY3JpcHQgd2lsbCBub3QgcmVhbGx5IGJlIHBhc3NlZCB0byBRRU1VCkFjdHVhbGx5
IHdlIGRvbid0IHBhc3MgYW55ICctY3B1IHh4eCcgdG8gUUVNVSwgc28gdGhlIFFFTVUgZGVmYXVs
dCBwbGF0Zm9ybSB3aWxsIGJlIHVzZWQuCgoKZm9yIGJlbG93IDMgaXNzdWVzLCBjb3VsZCB5b3Ug
cGFzdGUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZW0KCmkgaGF2ZSBhbHJlYWR5IHJlcHJvZHVjZWQg
Im1kYWRtLXNlbGZ0ZXN0cy5lbmNobWFya3MvbWRhZG0tc2VsZnRlc3RzL3Rlc3RzLzA2bmFtZS5m
YWlsIiAgYnkgZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbnMgZGVzY3JpYmVkIG9uIHRoaXMgbWFp
bAoKVGhhbmtzClpoaWppYW4KCjwvcHJlPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0
ZT0ibWlkOkNBSzhQM2EwMlVSTU5rUWZja1Y0eVkreEVSakJldHp6bVZXOXN1enZtMUIzV0U1Tmtn
QUBtYWlsLmdtYWlsLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9
IiI+CgozLiBlcnJvciAicWVtdTogbGludXgga2VybmVsIHRvbyBvbGQgdG8gbG9hZCBhIHJhbSBk
aXNrIi4gSSB0cmllZApsZWF2aW5nIG91dCB0aGUKICBpbml0cmFtZnMsIGtub3dpbmcgdGhhdCB0
aGlzIHdvdWxkIGZpbmFsbHkgYnJlYWsgdGhpbmdzIGlmIEkgc3RpbGwKaGFkIGEgY2hhbmNlIG9m
CiAgcmVwcm9kdWNpbmcgdGhlIGJ1ZyBhdCB0aGlzIHBvaW50LgoKNC4gcWVtdS1zeXN0ZW0teDg2
XzY0OiAtYXBwZW5kIHJvb3Q9L2Rldi9yYW0wOiBDb3VsZCBub3Qgb3BlbgondXNlcj1sa3AnOiBO
byBzdWNoCiAgIGZpbGUgb3IgZGlyZWN0b3J5LiBObyBpZGVhLiBJIHRyaWVkIHJlbW92aW5nIHRo
aXMuCgo1LiBDb3VsZCBub3Qgb3Blbgonam9iPS9sa3Avam9icy9zY2hlZHVsZWQvdm0tc25iLTRH
LTU1ZWU5NTkwYTRiOS9tZGFkbS1zZWxmdGVzdHMtMUhERC0wNi1kZWJpYW4teDg2XzY0LTIwMTgt
MDQtMDMuY2d6LTk3Y2E3MGUxNmRjNzZiYS0yMDE5MDcyOC01OTc0LTEzd2Q0OWYtMy55YW1sJzoK
VGhhdCBkaXJlY3RvcnkgZG9lcyBub3QgZXhpc3QsCmFuZCBJIGNvdWxkIG5vdCBmaW5kIHRoZSBm
aWxlIGVsc2V3aGVyZS4KCkFueSBzdWdnZXN0aW9ucz8KCiAgICAgICAgQXJuZAoKCjwvcHJlPgog
ICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPldlbGNvbWUgdG8gZmRpc2sgKHV0aWwtbGludXggMi4yOS4yKS4KQ2hh
bmdlcyB3aWxsIHJlbWFpbiBpbiBtZW1vcnkgb25seSwgdW50aWwgeW91IGRlY2lkZSB0byB3cml0
ZSB0aGVtLgpCZSBjYXJlZnVsIGJlZm9yZSB1c2luZyB0aGUgd3JpdGUgY29tbWFuZC4KCkRldmlj
ZSBkb2VzIG5vdCBjb250YWluIGEgcmVjb2duaXplZCBwYXJ0aXRpb24gdGFibGUuCkNyZWF0ZWQg
YSBuZXcgRE9TIGRpc2tsYWJlbCB3aXRoIGRpc2sgaWRlbnRpZmllciAweDhiNjAwYjEwLgoKQ29t
bWFuZCAobSBmb3IgaGVscCk6IFBhcnRpdGlvbiB0eXBlCiAgIHAgICBwcmltYXJ5ICgwIHByaW1h
cnksIDAgZXh0ZW5kZWQsIDQgZnJlZSkKICAgZSAgIGV4dGVuZGVkIChjb250YWluZXIgZm9yIGxv
Z2ljYWwgcGFydGl0aW9ucykKU2VsZWN0IChkZWZhdWx0IHApOiBQYXJ0aXRpb24gbnVtYmVyICgx
LTQsIGRlZmF1bHQgMSk6IEZpcnN0IHNlY3RvciAoMjA0OC01MzY4NzA5MTEsIGRlZmF1bHQgMjA0
OCk6IExhc3Qgc2VjdG9yLCArc2VjdG9ycyBvciArc2l6ZXtLLE0sRyxULFB9ICgyMDQ4LTUzNjg3
MDkxMSwgZGVmYXVsdCA1MzY4NzA5MTEpOgpDcmVhdGVkIGEgbmV3IHBhcnRpdGlvbiAxIG9mIHR5
cGUgJ0xpbnV4JyBhbmQgb2Ygc2l6ZSA1IEdpQi4KCkNvbW1hbmQgKG0gZm9yIGhlbHApOiBUaGUg
cGFydGl0aW9uIHRhYmxlIGhhcyBiZWVuIGFsdGVyZWQuCkNhbGxpbmcgaW9jdGwoKSB0byByZS1y
ZWFkIHBhcnRpdGlvbiB0YWJsZS4KU3luY2luZyBkaXNrcy4KCjIwMTktMDctMjggMDc6MjI6MDYg
bWtkaXIgLXAgL3Zhci90bXAKMjAxOS0wNy0yOCAwNzoyMjowNiBta2UyZnMgLXQgZXh0MyAtYiAx
MDI0IC1KIHNpemU9MSAtcSAvZGV2L3ZkYTEKMjAxOS0wNy0yOCAwNzoyMjowOCBtb3VudCAtdCBl
eHQzIC9kZXYvdmRhMSAvdmFyL3RtcApzZWQgLWUgJ3Mve0RFRkFVTFRfTUVUQURBVEF9LzEuMi9n
JyBcCi1lICdzLHtNQVBfUEFUSH0sL3J1bi9tZGFkbS9tYXAsZycgIG1kYWRtLjguaW4gJmd0OyBt
ZGFkbS44Ci91c3IvYmluL2luc3RhbGwgLUQgLW0gNjQ0IG1kYWRtLjggL3Vzci9zaGFyZS9tYW4v
bWFuOC9tZGFkbS44Ci91c3IvYmluL2luc3RhbGwgLUQgLW0gNjQ0IG1kbW9uLjggL3Vzci9zaGFy
ZS9tYW4vbWFuOC9tZG1vbi44Ci91c3IvYmluL2luc3RhbGwgLUQgLW0gNjQ0IG1kLjQgL3Vzci9z
aGFyZS9tYW4vbWFuNC9tZC40Ci91c3IvYmluL2luc3RhbGwgLUQgLW0gNjQ0IG1kYWRtLmNvbmYu
NSAvdXNyL3NoYXJlL21hbi9tYW41L21kYWRtLmNvbmYuNQovdXNyL2Jpbi9pbnN0YWxsIC1EIC1t
IDY0NCB1ZGV2LW1kLXJhaWQtY3JlYXRpbmcucnVsZXMgL2xpYi91ZGV2L3J1bGVzLmQvMDEtbWQt
cmFpZC1jcmVhdGluZy5ydWxlcwovdXNyL2Jpbi9pbnN0YWxsIC1EIC1tIDY0NCB1ZGV2LW1kLXJh
aWQtYXJyYXlzLnJ1bGVzIC9saWIvdWRldi9ydWxlcy5kLzYzLW1kLXJhaWQtYXJyYXlzLnJ1bGVz
Ci91c3IvYmluL2luc3RhbGwgLUQgLW0gNjQ0IHVkZXYtbWQtcmFpZC1hc3NlbWJseS5ydWxlcyAv
bGliL3VkZXYvcnVsZXMuZC82NC1tZC1yYWlkLWFzc2VtYmx5LnJ1bGVzCi91c3IvYmluL2luc3Rh
bGwgLUQgLW0gNjQ0IHVkZXYtbWQtY2x1c3RlcmVkLWNvbmZpcm0tZGV2aWNlLnJ1bGVzIC9saWIv
dWRldi9ydWxlcy5kLzY5LW1kLWNsdXN0ZXJlZC1jb25maXJtLWRldmljZS5ydWxlcwovdXNyL2Jp
bi9pbnN0YWxsIC1EICAtbSA3NTUgbWRhZG0gL3NiaW4vbWRhZG0KL3Vzci9iaW4vaW5zdGFsbCAt
RCAgLW0gNzU1IG1kbW9uIC9zYmluL21kbW9uClRlc3Rpbmcgb24gbGludXgtNS4zLjAtcmMxLWc5
N2NhNzBlMTZkYzc2YiBrZXJuZWwKL2xrcC9iZW5jaG1hcmtzL21kYWRtLXNlbGZ0ZXN0cy90ZXN0
cy8wNm5hbWUuLi4gRkFJTEVEIC0gc2VlIC92YXIvdG1wLzA2bmFtZS5sb2cgYW5kIC92YXIvdG1w
L2ZhaWwwNm5hbWUubG9nIGZvciBkZXRhaWxzCjA2bmFtZSBUSU1FT1VUClRlc3Rpbmcgb24gbGlu
dXgtNS4zLjAtcmMxLWc5N2NhNzBlMTZkYzc2YiBrZXJuZWwKL2xrcC9iZW5jaG1hcmtzL21kYWRt
LXNlbGZ0ZXN0cy90ZXN0cy8wNnN5c2ZzLi4uIHN1Y2NlZWRlZAowNnN5c2ZzIFRJTUVPVVQKVGVz
dGluZyBvbiBsaW51eC01LjMuMC1yYzEtZzk3Y2E3MGUxNmRjNzZiIGtlcm5lbAovbGtwL2JlbmNo
bWFya3MvbWRhZG0tc2VsZnRlc3RzL3Rlc3RzLzA2d3Jtb3N0bHkuLi4gRkFJTEVEIC0gc2VlIC92
YXIvdG1wLzA2d3Jtb3N0bHkubG9nIGFuZCAvdmFyL3RtcC9mYWlsMDZ3cm1vc3RseS5sb2cgZm9y
IGRldGFpbHMKMDZ3cm1vc3RseSBUSU1FT1VUCgoKVG8gcmVwcm9kdWNlOgoKICAgICAgICAjIGJ1
aWxkIGtlcm5lbAogICAgICAgIGNkIGxpbnV4CiAgICAgICAgY3AgY29uZmlnLTUuMy4wLXJjMS1n
OTdjYTcwZTE2ZGM3NmIgLmNvbmZpZwogICAgICAgIG1ha2UgSE9TVENDPWdjYy03IENDPWdjYy03
IEFSQ0g9eDg2XzY0IG9sZGRlZmNvbmZpZyBwcmVwYXJlIG1vZHVsZXNfcHJlcGFyZSBiekltYWdl
IG1vZHVsZXMKICAgICAgICBtYWtlIEhPU1RDQz1nY2MtNyBDQz1nY2MtNyBBUkNIPXg4Nl82NCBJ
TlNUQUxMX01PRF9QQVRIPSZsdDttb2QtaW5zdGFsbC1kaXImZ3Q7IG1vZHVsZXNfaW5zdGFsbAog
ICAgICAgIGNkICZsdDttb2QtaW5zdGFsbC1kaXImZ3Q7CiAgICAgICAgZmluZCBsaWIvIHwgY3Bp
byAtbyAtSCBuZXdjIC0tcXVpZXQgfCBnemlwICZndDsgbW9kdWxlcy5jZ3oKCgogICAgICAgIGdp
dCBjbG9uZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xr
cC10ZXN0cy5naXQ8L2E+CiAgICAgICAgY2QgbGtwLXRlc3RzCiAgICAgICAgYmluL2xrcCBxZW11
IC1rICZsdDtiekltYWdlJmd0OyAtbSBtb2R1bGVzLmNneiBqb2Itc2NyaXB0ICMgam9iLXNjcmlw
dCBpcyBhdHRhY2hlZCBpbiB0aGlzIGVtYWlsCgoKClRoYW5rcywKUm9uZyBDaGVuCgo8L3ByZT4K
ICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFw
PSIiPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxLUCBt
YWlsaW5nIGxpc3QKPGEgY2xhc3M9Im1vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0ibWFp
bHRvOkxLUEBsaXN0cy4wMS5vcmciPkxLUEBsaXN0cy4wMS5vcmc8L2E+CjxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4vbGlz
dGluZm8vbGtwIj5odHRwczovL2xpc3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xrcDwvYT4K
PC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============0630656987920126384==--

