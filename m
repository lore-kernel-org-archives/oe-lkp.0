Content-Type: multipart/mixed; boundary="===============7244990229211235011=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi, block] 0dba1314d4: WARNING:at_fs/sysfs/dir.c:#sysfs_warn_dup
Date: Sun, 05 Feb 2017 18:42:16 -0800
Message-ID: <CAPcyv4g+F_couGSaHqvhXrMxmU6T9-eu0c+dJpJSzg4qWpEn_g@mail.gmail.com>
In-Reply-To: <20170206020249.GL12121@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7244990229211235011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 5, 2017 at 6:02 PM, Ye Xiaolong <xiaolong.ye@intel.com> wrote:
> On 02/05, Dan Williams wrote:
>>On Sun, Feb 5, 2017 at 4:57 PM, Ye Xiaolong <xiaolong.ye@intel.com> wro=
te:
>>> On 02/05, Dan Williams wrote:
>>>>On Fri, Feb 3, 2017 at 11:09 PM, kernel test robot
>>>><xiaolong.ye@intel.com> wrote:
>>>>>
>>>>> FYI, we noticed the following commit:
>>>>>
>>>>> commit: 0dba1314d4f81115dce711292ec7981d17231064 ("scsi, block: fix d=
uplicate bdi name registration crashes")
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git=
 for-4.11/next
>>>>>
>>>>> in testcase: boot
>>>>>
>>>>> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+sma=
p -m 360M
>>>>>
>>>>> caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
>>>>[..]
>>>>> To reproduce:
>>>>>
>>>>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/l=
kp-tests.git
>>>>>         cd lkp-tests
>>>>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attache=
d in this email
>>>>
>>>>I tried this on a Fedora 24 system but was unsuccessful. Does it need
>>>>to be run as root?
>>>
>>> No, It doesn't need root privilege, could you paste some log for me to =
check?
>>>
>>
>>Attached is the output from:
>>
>>./bin/lkp qemu -k ~/git/linux/arch/x86/boot/bzImage job-script >out 2>&1
>>
>
> Hmm, I believe it was caused by job-script saved as dos format, I can rep=
roduce
> it when I downloaded it through outlook attachment.
>
> Try `dos2unix job-script` before "lkp qemu" to see whether it works.
>

Ah, good catch. I'm able to reproduce it now. Thank you!

--===============7244990229211235011==--

