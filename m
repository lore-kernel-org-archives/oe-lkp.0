Content-Type: multipart/mixed; boundary="===============6846894471339731984=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ALSA] e6a1b7e880: kmsg.parport#:cannot_grant_exclusive_access_for_device_portman
Date: Sat, 19 May 2018 15:43:47 +0800
Message-ID: <20180519074347.GA13513@yexl-desktop>
In-Reply-To: <CADVatmPp=zSc+NqhhAsik1r_kvheUGrjwG8siX7fDfiwztxNvg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6846894471339731984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/18, Sudip Mukherjee wrote:
>Hi Xiaolong,
>
>This is expected behaviour. lp0 has already registered with the
>parport at 3.931898 sec.
>So, when portman tries to register for exclusive access, it is denied
>as another device has
>already registered with the parport. And parport code says:
>/*
> * If a device is already registered and this new
> * device wants exclusive access, then no need to
> * continue as we can not grant exclusive access to
> * this device.
> */
>
>Similar error is with ks0108 also in your dmesg.

Thanks for your explanation.

Thanks,
Xiaolong

>
>--
>Regards
>Sudip
>
>On Thu, May 17, 2018 at 2:54 AM, kernel test robot
><xiaolong.ye@intel.com> wrote:
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: e6a1b7e88046055989b8b59c1d648fda4e606f34 ("ALSA: portman2x4 - us=
e new parport device model")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu Nehalem -smp 2 -m 5=
12M
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>> [    4.394883] parport0: cannot grant exclusive access for device portman
>>
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
>>
>>
>>
>> Thanks,
>> Xiaolong

--===============6846894471339731984==--

