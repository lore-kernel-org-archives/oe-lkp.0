Content-Type: multipart/mixed; boundary="===============4302959686517663870=="
MIME-Version: 1.0
From: Laura Abbott <labbott@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Tue, 31 Oct 2017 14:58:42 -0700
Message-ID: <19d76d06-1aba-351c-9b7f-2c861828501c@redhat.com>
In-Reply-To: <CAOuPNLi8yonLAEP=-q91z61minP8TKHKo_VShD1DgbHWCq69Fw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4302959686517663870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/31/2017 03:21 AM, Pintu Kumar wrote:
> On Tue, Oct 31, 2017 at 2:32 AM, Laura Abbott <labbott@redhat.com> wrot=
e:
>> On 10/30/2017 12:12 AM, Pintu Kumar wrote:
>>> On Sun, Oct 29, 2017 at 7:51 PM, kernel test robot
>>> <xiaolong.ye@intel.com> wrote:
>>>>
>>>> FYI, we noticed the following commit (built with gcc-6):
>>>>
>>>> commit: 5fb70554d68e2ea032b6a28b082801d8b7b76cb8 ("android/ion: usersp=
ace test utility for ion buffer sharing")
>>>> url: https://github.com/0day-ci/linux/commits/Pintu-Agarwal/android-io=
n-userspace-test-utility-for-ion-buffer-sharing/20171025-022548
>>>>
>>>>
>>>> in testcase: kernel_selftests
>>>> with following parameters:
>>>>
>>>>
>>>> test-description: The kernel contains a set of "self tests" under the =
tools/testing/selftests/ directory. These are intended to be small unit tes=
ts to exercise individual code paths in the kernel.
>>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>>>
>>>>
>>>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz =
with 64G memory
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>>>>
>>>>
>>>>
>>>>
>>>> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-r=
hel-7.2-5fb70554d68e2ea032b6a28b082801d8b7b76cb8
>>>> 2017-10-26 22:18:16 ln -sf /usr/bin/gcc-5 /usr/bin/gcc
>>>>
>>>> 2017-10-26 22:18:16 make run_tests -C android
>>>> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-5fb=
70554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/android'
>>>> make[1]: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7.2-=
5fb70554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/android/io=
n'
>>>> gcc  -I../../../../../drivers/staging/android/uapi/ -Wall -O2 -g    io=
napp_export.c ipcsocket.c ionutils.c   -o ionapp_export
>>>> In file included from ionapp_export.c:28:0:
>>>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>>>> compilation terminated.
>>>> In file included from ionutils.c:9:0:
>>>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>>>> compilation terminated.
>>>
>>> This utility requires ion.h header file which should be included from
>>> kernel source tree: drivers/staging/android/ion/uapi/
>>> This is already mentioned in the ion/Makefile
>>> Looks like this ion.h is not getting included inside the linux_headers_=
dir ?
>>>
>>> Shall I include the ion.h locally in my selftests?
>>> Or, is there a better way to include the header directly...
>>>
>>>
>>
>>
>> I can't reproduce this in any of my environments but if I had to guess,
>> it's because you have
>>
>> #include "ion.h"
>>
>> which is supposed to look in the local path.
>>
> =

> I don't think this is the problem.
> It just means, first it will look into the local path, then it will
> look into the include path which is specified in the Makefile.
> And, in the Makefile I have already included the path where it exists.
> INCLUDEDIR :=3D -I../../../../../drivers/staging/android/uapi/
> =


Ah yeah you are right

> I think the problem is in general, and not specific to this test.
> Because, when I manually try to install the kernel headers, I could
> not find the "ion.h" there, or none of the headers from
> drivers/staging/android/
> # make headers_install ARCH=3Di386 INSTALL_HDR_PATH=3D../headers/
> =

> But, I can see the drivers/android/ header files.
> =

> Now the question is, how to include the header files from staging
> folder to kernel headers ?
> =

> As per reference from some other selftests (such as: gpio/Makefile,
> vm/Makefile, etc.), I also tried the following.
> =

> ../../../../../drivers/staging/android/uapi/ion.h:
>         make -C ../../../../.. headers_install
> INSTALL_HDR_PATH=3D$(shell pwd)/../../../../usr/
> =

> But this also does not help in installing the ion.h header file in
> kernel_header path.
> =

> Any other pointers to fix this issue ?
> =


The staging uapi headers don't look to be installed with the
standard install command. This makes sense given that staging
drivers are well staging and not yet stable.

The tools/gpio Makefile seems to do this trick to allow compilation
outside the kernel tree (it is a dependency for the gpio selftest)

#
# We need the following to be outside of kernel tree
#
$(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux/gpio.h
        mkdir -p $(OUTPUT)include/linux 2>&1 || true
        ln -sf $(CURDIR)/../../include/uapi/linux/gpio.h $@

prepare: $(OUTPUT)include/linux/gpio.h

Maybe something like that needs to happen here unless Shuah has
any better ideas for headers?

Thanks,
Laura

> =

> Thanks,
> Pintu
> =

> =

>> Thanks,
>> Laura


--===============4302959686517663870==--

