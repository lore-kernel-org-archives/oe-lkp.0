Content-Type: multipart/mixed; boundary="===============3023032835157642916=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [platform/x86] a869ab5dab: BUG:unable_to_handle_kernel
Date: Mon, 27 Feb 2017 09:31:08 +0800
Message-ID: <20170227013108.GC32284@yexl-desktop>
In-Reply-To: <20170227011143.GI3807@marvin.atrad.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3023032835157642916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/27, Jonathan Woithe wrote:
>On Mon, Feb 27, 2017 at 09:04:14AM +0800, kernel test robot wrote:
>> FYI, we noticed the following commit:
>> =

>> commit: a869ab5dabf6ec5327a3b2bb366eccf80b207d76 ("platform/x86: fujitsu=
-laptop: only register backlight device if FUJ02B1 is present")
>> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git test=
ing
>> =

>> in testcase: boot
>> =

>> on test machine: qemu-system-i386 -enable-kvm -m 360M
>> =

>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>
>This is due to the accidental merge of patch 08/10 in the patch series. =

>This was spotted by Michael and I understand Andy is addressing the
>oversight.

Got it, thanks for watching the report.

Thanks,
Xiaolong
>
>Regards
>  jonathan

--===============3023032835157642916==--

