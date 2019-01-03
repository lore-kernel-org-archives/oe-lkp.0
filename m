Content-Type: multipart/mixed; boundary="===============3089839948743201394=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: bea5b158ff BUG: kernel reboot-without-warning in boot-around-mounting-root stage
Date: Thu, 03 Jan 2019 08:44:42 +0800
Message-ID: <728637bb-3ffe-d19a-4ca9-5abe1617e12a@intel.com>
In-Reply-To: <20190102095844.GB14448@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3089839948743201394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 01/02/2019 05:58 PM, Greg Kroah-Hartman wrote:
> On Wed, Jan 02, 2019 at 09:15:12AM +0800, kernel test robot wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>
>> commit bea5b158ff0da9c7246ff391f754f5f38e34577a
>> Author:     Rob Herring <robh@kernel.org>
>> AuthorDate: Thu Aug 11 10:20:58 2016 -0500
>> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> CommitDate: Wed Aug 31 15:13:55 2016 +0200
>>
>>      driver core: add test of driver remove calls during probe
>>      =

>>      In recent discussions on ksummit-discuss[1], it was suggested to do=
 a
>>      sequence of probe, remove, probe for testing driver remove paths. T=
his
>>      adds a kconfig option for said test.
>>      =

>>      [1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/201=
6-August/003459.html
>>      =

>>      Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>      Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>      Signed-off-by: Rob Herring <robh@kernel.org>
>>      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> cebf8fd169  driver core: fix race between creating/querying glue dir and=
 its cleanup
>> bea5b158ff  driver core: add test of driver remove calls during probe
>> e1ef035d27  Merge tag 'armsoc-defconfig' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm/arm-soc
>> 6a1d293238  Add linux-next specific files for 20181224
>> +----------------------------------------------------------------------+=
------------+------------+------------+---------------+
>> |                                                                      |=
 cebf8fd169 | bea5b158ff | e1ef035d27 | next-20181224 |
>> +----------------------------------------------------------------------+=
------------+------------+------------+---------------+
>> | boot_successes                                                       |=
 31         | 0          | 0          | 0             |
>> | boot_failures                                                        |=
 0          | 11         | 11         | 7             |
>> | BUG:kernel_reboot-without-warning_in_boot-around-mounting-root_stage |=
 0          | 11         | 11         | 7             |
>> +----------------------------------------------------------------------+=
------------+------------+------------+---------------+
>>
>> [   14.073515] shpchp: Standard Hot Plug PCI Controller Driver version: =
0.4
>> [   14.095297] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
>> [   14.177113] serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D =
115200) is a 16550A
>> [   14.256672] serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D =
115200) is a 16550A
>> [   14.278578] console [ttyS0] disabled
>> BUG: kernel reboot-without-warning in boot-around-mounting-root stage
>>
>>
>>                                                            # HH:MM RESUL=
T GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
>> git bisect start v4.9 v4.8 --
> You are testing the 4.9 kernel release here?
>
> A commit from 2016 is a "problem"?  Are you sure this is still an issue?

I'm very sorry for the old commit report, we're testing latest code,
and the robot shouldn't track old commits. we'll fix it.

Best Regards,
Rong Chen

>
> thanks,
>
> greg k-h


--===============3089839948743201394==--

