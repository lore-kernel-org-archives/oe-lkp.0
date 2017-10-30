Content-Type: multipart/mixed; boundary="===============8870968814769540388=="
MIME-Version: 1.0
From: Laura Abbott <labbott@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Mon, 30 Oct 2017 14:02:56 -0700
Message-ID: <8e7d8bbb-ec51-b693-aa35-1af73c163299@redhat.com>
In-Reply-To: <CAOuPNLi+yfbO00o-TKRpaDKT6ZhOcdho6oY21X9m6drK=xWuzA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8870968814769540388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/30/2017 12:12 AM, Pintu Kumar wrote:
> On Sun, Oct 29, 2017 at 7:51 PM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
>>
>> FYI, we noticed the following commit (built with gcc-6):
>>
>> commit: 5fb70554d68e2ea032b6a28b082801d8b7b76cb8 ("android/ion: userspac=
e test utility for ion buffer sharing")
>> url: https://github.com/0day-ci/linux/commits/Pintu-Agarwal/android-ion-=
userspace-test-utility-for-ion-buffer-sharing/20171025-022548
>>
>>
>> in testcase: kernel_selftests
>> with following parameters:
>>
>>
>> test-description: The kernel contains a set of "self tests" under the to=
ols/testing/selftests/ directory. These are intended to be small unit tests=
 to exercise individual code paths in the kernel.
>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>
>>
>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wi=
th 64G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhe=
l-7.2-5fb70554d68e2ea032b6a28b082801d8b7b76cb8
>> 2017-10-26 22:18:16 ln -sf /usr/bin/gcc-5 /usr/bin/gcc
>>
>> 2017-10-26 22:18:16 make run_tests -C android
>> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-5fb70=
554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/android'
>> make[1]: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-5f=
b70554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/android/ion'
>> gcc  -I../../../../../drivers/staging/android/uapi/ -Wall -O2 -g    iona=
pp_export.c ipcsocket.c ionutils.c   -o ionapp_export
>> In file included from ionapp_export.c:28:0:
>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>> compilation terminated.
>> In file included from ionutils.c:9:0:
>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>> compilation terminated.
> =

> This utility requires ion.h header file which should be included from
> kernel source tree: drivers/staging/android/ion/uapi/
> This is already mentioned in the ion/Makefile
> Looks like this ion.h is not getting included inside the linux_headers_di=
r ?
> =

> Shall I include the ion.h locally in my selftests?
> Or, is there a better way to include the header directly...
> =

> =



I can't reproduce this in any of my environments but if I had to guess,
it's because you have =


#include "ion.h"

which is supposed to look in the local path.

Thanks,
Laura

--===============8870968814769540388==--

