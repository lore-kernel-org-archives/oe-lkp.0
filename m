Content-Type: multipart/mixed; boundary="===============7546696446245297513=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [asm] c1aad8dcc4: BUG:kernel_hang_in_boot_stage
Date: Tue, 16 May 2017 13:00:58 +0800
Message-ID: <20170516050058.GB18220@yexl-desktop>
In-Reply-To: <20170516012958.GP390@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7546696446245297513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05/16, Al Viro wrote:
>On Tue, May 16, 2017 at 09:19:57AM +0800, kernel test robot wrote:
>> =

>> FYI, we noticed the following commit:
>> =

>> commit: c1aad8dcc49382399f48541dc47b6e30b0ef1b62 ("asm-generic: zero in =
__get_user(), not __get_user_fn()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: trinity
>> with following parameters:
>> =

>> 	runtime: 300s
>> =

>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>> =

>> =

>> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 420M
>
>Huh?  That commit touches only include/asm-generic/uaccess.h and
>this file is not even looked at during x86 builds.

Just double checked, this error also showed in parent commit. So it's a fal=
se
positive. Sorry for the noise.

Thanks,
Xiaolong

--===============7546696446245297513==--

