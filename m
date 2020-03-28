Content-Type: multipart/mixed; boundary="===============5233379282715590292=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: IOZone error
Date: Sat, 28 Mar 2020 11:48:01 +0800
Message-ID: <9b3ae358-daeb-1246-c621-c301e8e76930@cn.fujitsu.com>
In-Reply-To: <CANmdEh2aSAXKpQSAd3vXrApO3vUYpN2HJqhipEgu1SSSJRJ8-A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5233379282715590292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,=C2=A0 Sorry for delay.

On 3/28/20 1:10 AM, Deepa B wrote:
> Hello,
> This is the /dev dir listing:
>
> X86: /dev
>
> acpi_thermal_rel fuse loop11 net shm tty22 tty45 ttyS0 ttyS31 vcsa4
> autofs gpiochip0 loop12 network_latency snapshot tty23 tty46 ttyS1
> ttyS4 vcsa5 block hidraw0 loop13 network_throughput snd tty24 tty47
> ttyS10 ttyS5 vcsa6 bsg hpet loop14 null sr0 tty25 tty48 ttyS11 ttyS6
> vcsu btrfs-control hugepages loop15 nvram stderr tty26 tty49 ttyS12
> ttyS7 vcsu1 bus hwrng loop16 port stdin tty27 tty5 ttyS13 ttyS8 vcsu2
> cdrom i2c-0 loop17 ppp stdout tty28 tty50 ttyS14 ttyS9 vcsu3 cdrw
> i2c-1 loop18 psaux tpm0 tty29 tty51 ttyS15 udmabuf vcsu4 char i2c-2
> loop19 ptmx tpmrm0 tty3 tty52 ttyS16 uhid vcsu5 console i2c-3 loop2
> pts tty tty30 tty53 ttyS17 uinput vcsu6 core i2c-4 loop3 random tty0
> tty31 tty54 ttyS18 urandom vfio cpu i2c-5 loop4 rfkil tty1 tty32 tty55
> ttyS19 userio vga_arbiter cpu_dma_latency i2c-6 loop5 rtc tty10 tty33
> tty56 ttyS2 v4l vhci cuse i2c-7 loop6 rtc0 tty11 tty34 tty57 ttyS20
> v4l-touch0 vhost-net disk i2c-8 loop7 sda tty12 tty35 tty58 ttyS21 vcs
> vhost-vsock dri i2c-9 loop8 sda1 tty13 tty36 tty59 ttyS22 vcs1 video0
> drm_dp_aux0 initctl loop9 sda2 tty14 tty37 tty6 ttyS23 vcs2 video1
> drm_dp_aux1 input loop-control sda3 tty15 tty38 tty60 ttyS24 vcs3 zero
> drm_dp_aux2 kmsg mapper sda4 tty16 tty39 tty61 ttyS25 vcs4 zfs dvd kvm
> mcelog sda5 tty17 tty4 tty62 ttyS26 vcs5 dvdrw lightnvm media0 sda6
> tty18 tty40 tty63 ttyS27 vcs6 ecryptfs log mei0 sda7 tty19 tty41 tty7
> ttyS28 vcsa fb0 loop0 mem sda8 tty2 tty42 tty8 ttyS29 vcsa1 fd loop1
> memory_bandwidth sg0 tty20 tty43 tty9 ttyS3 vcsa2 full loop10 mqueue
> sg1 tty21 tty44 ttyprintk ttyS30 vcsa3


2 ways to specify testing disks.

a) specify hdd/ssd info in lkp-tests/host/${HOSTNAME}

lkp-tests/host/${HOSTNAME} should exist if you have finished "lkp =

install XXX.yaml"

If file exists, edit file directly to specify testing hdd/ssd.

```

liuyd(a)liuyd-ubuntu1804:~/lkp-tests/hosts$ cat liuyd-ubuntu1804
nr_cpu: 2
memory: 3G
hdd_partitions: /dev/vda1 /dev/vda2
ssd_partitions: /dev/sda1 /dev/sda2
local_run: 1

```

You could refer to files lkp-tests/hosts/ to edit it.


b) lkp install --hdd /dev/testing_hdd ./iozone-2HDD-ext4-kyber.yaml

If host/${HOSTNAME} doesn't exist.

You could specify hdd/ssd when you install job.

liuyd(a)liuyd-ubuntu1804:~/lkp-tests/hosts$ sudo lkp install --help
[sudo] password for liuyd:
Usage: lkp install [options] [<script>/<jobfile>]
options:
-f|--force: force to install testsuites
--hdd partition: HDD partition for IO tests
--ssd partition: SSD partition for IO tests



If possible, please submit issue at https://github.com/intel/lkp-tests =

for further discussion or other problems.


>
> [snip]
>
> Please let us know if additional info needed.
>
> Thanks,
> Deepa
>
> On Fri, 27 Mar 2020 at 15:52, Liu Yiding <yidingx.liu@intel.com> wrote:
>> Hi,
>>
>> On 3/27/20 5:58 PM, Deepa B wrote:
>>> Hello,
>>> Iozone benchmark is run through LKP on X86 (Linux kernel - 5.3.0,
>>> Intel(R) Pentium(R) CPU  N3710  @ 1.60GHz) & RISC-V U540(Yocto Linux
>>> kernel - 5.4.3). Get same error with HDD disks on both.
>>>
>>> Command:  lkp run ./iozone-2HDD-ext4-kyber.yaml
>>> rm due to not enough HDD disks
>>> need: 2, has: 0
>> This job is filterd by lkp-tests/filters/disk, please ensure your host
>> has enough hdd disks.
>>
>>
>> It is possible that lkp can't get your host disks info correctly.
>>
>> So if your host does have 2 hdd disks, please comment out filters/disk,
>> just return 0 as an workaround.
>>
>> And share us your /dev info, we will fix it asap.
>>
>>
>>> Traceback (most recent call last):
>>> 6: from /home/test/Ankita/lkp-tests/bin/run-local:131:in
>>>
>>> ' 5: from /home/test/Ankita/lkp-tests/lib/job.rb:691:in expand_params'
>>> 4: from /home/test/Ankita/lkp-tests/lib/job.rb:77:in for_each_in' 3:
>>> from /home/test/Ankita/lkp-tests/lib/job.rb:77:in each'
>>> 2: from /home/test/Ankita/lkp-tests/lib/job.rb:78:in block in
>>> for_each_in' 1: from /home/test/Ankita/lkp-tests/lib/job.rb:694:in
>>> block in expand_params'
>>> /home/test/Ankita/lkp-tests/lib/job.rb:669:in `run_filter':
>>> /home/test/Ankita/lkp-tests/filters/disk: exitstatus 1
>>> (Job::ParamError)
>>>
>>> Could you please help us resolve this?
>>>
>>> Thanks,
>>> Deepa
>>> _______________________________________________
>>> LKP mailing list -- lkp(a)lists.01.org
>>> To unsubscribe send an email to lkp-leave(a)lists.01.org
>> --
>> Best regards.
>> Liu Yiding
>> _______________________________________________
>> LKP mailing list -- lkp(a)lists.01.org
>> To unsubscribe send an email to lkp-leave(a)lists.01.org
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
>
>
-- =

Best Regards.
Liu Yiding



--===============5233379282715590292==--

