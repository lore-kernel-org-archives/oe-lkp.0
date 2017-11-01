Content-Type: multipart/mixed; boundary="===============6199358426125376011=="
MIME-Version: 1.0
From: Shuah Khan <shuahkh@osg.samsung.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [android/ion] 5fb70554d6: kernel_selftests.android.make_fail
Date: Wed, 01 Nov 2017 16:38:02 -0600
Message-ID: <13c66c9d-485f-7615-7a85-47bad9af30d1@osg.samsung.com>
In-Reply-To: <CAOuPNLjR+3xKoycWc_aYD7e8sh0g-38qQ405A8AN2uCbOOhUBw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6199358426125376011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/01/2017 11:14 AM, Pintu Kumar wrote:
> On Wed, Nov 1, 2017 at 10:27 PM, Shuah Khan <shuah@kernel.org> wrote:
>> On 11/01/2017 10:26 AM, Pintu Kumar wrote:
>>> On Wed, Nov 1, 2017 at 8:34 PM, Shuah Khan <shuah@kernel.org> wrote:
>>>> On 11/01/2017 04:12 AM, Pintu Kumar wrote:
>>>>> On Wed, Nov 1, 2017 at 3:28 AM, Laura Abbott <labbott@redhat.com> w=
rote:
>>>>>> On 10/31/2017 03:21 AM, Pintu Kumar wrote:
>>>>>>> On Tue, Oct 31, 2017 at 2:32 AM, Laura Abbott <labbott@redhat.com=
> wrote:
>>>>>>>> On 10/30/2017 12:12 AM, Pintu Kumar wrote:
>>>>>>>>> On Sun, Oct 29, 2017 at 7:51 PM, kernel test robot
>>>>>>>>> <xiaolong.ye@intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>> FYI, we noticed the following commit (built with gcc-6):
>>>>>>>>>>
>>>>>>>>>> commit: 5fb70554d68e2ea032b6a28b082801d8b7b76cb8 ("android/ion: =
userspace test utility for ion buffer sharing")
>>>>>>>>>> url: https://github.com/0day-ci/linux/commits/Pintu-Agarwal/andr=
oid-ion-userspace-test-utility-for-ion-buffer-sharing/20171025-022548
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> in testcase: kernel_selftests
>>>>>>>>>> with following parameters:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> test-description: The kernel contains a set of "self tests" unde=
r the tools/testing/selftests/ directory. These are intended to be small un=
it tests to exercise individual code paths in the kernel.
>>>>>>>>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.=
20GHz with 64G memory
>>>>>>>>>>
>>>>>>>>>> caused below changes (please refer to attached dmesg/kmsg for en=
tire log/backtrace):
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x8=
6_64-rhel-7.2-5fb70554d68e2ea032b6a28b082801d8b7b76cb8
>>>>>>>>>> 2017-10-26 22:18:16 ln -sf /usr/bin/gcc-5 /usr/bin/gcc
>>>>>>>>>>
>>>>>>>>>> 2017-10-26 22:18:16 make run_tests -C android
>>>>>>>>>> make: Entering directory '/usr/src/linux-selftests-x86_64-rhel-7=
.2-5fb70554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/android'
>>>>>>>>>> make[1]: Entering directory '/usr/src/linux-selftests-x86_64-rhe=
l-7.2-5fb70554d68e2ea032b6a28b082801d8b7b76cb8/tools/testing/selftests/andr=
oid/ion'
>>>>>>>>>> gcc  -I../../../../../drivers/staging/android/uapi/ -Wall -O2 -g=
    ionapp_export.c ipcsocket.c ionutils.c   -o ionapp_export
>>>>>>>>>> In file included from ionapp_export.c:28:0:
>>>>>>>>>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>>>>>>>>>> compilation terminated.
>>>>>>>>>> In file included from ionutils.c:9:0:
>>>>>>>>>> ionutils.h:4:17: fatal error: ion.h: No such file or directory
>>>>>>>>>> compilation terminated.
>>>>>>>>>
>>>>>>>>> This utility requires ion.h header file which should be included =
from
>>>>>>>>> kernel source tree: drivers/staging/android/ion/uapi/
>>>>>>>>> This is already mentioned in the ion/Makefile
>>>>>>>>> Looks like this ion.h is not getting included inside the linux_he=
aders_dir ?
>>>>>>>>>
>>>>>>>>> Shall I include the ion.h locally in my selftests?
>>>>>>>>> Or, is there a better way to include the header directly...
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> I can't reproduce this in any of my environments but if I had to g=
uess,
>>>>>>>> it's because you have
>>>>>>>>
>>>>>>>> #include "ion.h"
>>>>>>>>
>>>>>>>> which is supposed to look in the local path.
>>>>>>>>
>>>>>>>
>>>>>>> I don't think this is the problem.
>>>>>>> It just means, first it will look into the local path, then it will
>>>>>>> look into the include path which is specified in the Makefile.
>>>>>>> And, in the Makefile I have already included the path where it exis=
ts.
>>>>>>> INCLUDEDIR :=3D -I../../../../../drivers/staging/android/uapi/
>>>>>>>
>>>>>>
>>>>>> Ah yeah you are right
>>>>>>
>>>>>>> I think the problem is in general, and not specific to this test.
>>>>>>> Because, when I manually try to install the kernel headers, I could
>>>>>>> not find the "ion.h" there, or none of the headers from
>>>>>>> drivers/staging/android/
>>>>>>> # make headers_install ARCH=3Di386 INSTALL_HDR_PATH=3D../headers/
>>>>>>>
>>>>>>> But, I can see the drivers/android/ header files.
>>>>>>>
>>>>>>> Now the question is, how to include the header files from staging
>>>>>>> folder to kernel headers ?
>>>>>>>
>>>>>>> As per reference from some other selftests (such as: gpio/Makefile,
>>>>>>> vm/Makefile, etc.), I also tried the following.
>>>>>>>
>>>>>>> ../../../../../drivers/staging/android/uapi/ion.h:
>>>>>>>         make -C ../../../../.. headers_install
>>>>>>> INSTALL_HDR_PATH=3D$(shell pwd)/../../../../usr/
>>>>>>>
>>>>>>> But this also does not help in installing the ion.h header file in
>>>>>>> kernel_header path.
>>>>>>>
>>>>>>> Any other pointers to fix this issue ?
>>>>>>>
>>>>>>
>>>>>> The staging uapi headers don't look to be installed with the
>>>>>> standard install command. This makes sense given that staging
>>>>>> drivers are well staging and not yet stable.
>>>>>>
>>>>>> The tools/gpio Makefile seems to do this trick to allow compilation
>>>>>> outside the kernel tree (it is a dependency for the gpio selftest)
>>>>>>
>>>>>> #
>>>>>> # We need the following to be outside of kernel tree
>>>>>> #
>>>>>> $(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux/gpio.h
>>>>>>         mkdir -p $(OUTPUT)include/linux 2>&1 || true
>>>>>>         ln -sf $(CURDIR)/../../include/uapi/linux/gpio.h $@
>>>>>>
>>>>>> prepare: $(OUTPUT)include/linux/gpio.h
>>>>>>
>>>>>
>>>>> I tried something similar, but it did not help.
>>>>> Or may be I could not understand how to incorporate this into my code
>>>>> to make it work.
>>>>> Basically, when I do make in gpio, it automatically does this using:
>>>>> make -C headers_install.
>>>>> But in my case, this command is not getting invoked, using the follow=
ing:
>>>>> ../../../../../drivers/staging/android/uapi/ion.h:
>>>>>         make -C ../../../../.. headers_install
>>>>> INSTALL_HDR_PATH=3D$(shell pwd)/../../../../usr/
>>>>>
>>>>>
>>>>> https://kernelnewbies.org/KernelHeaders
>>>>> It says:
>>>>> [The correct way to address this problem is to isolate the specific
>>>>> interfaces that you need, e.g. a single header file that is patched in
>>>>> a new kernel providing the ioctl numbers for a character device used
>>>>> by your program. In your own program, add a copy of that source file,
>>>>> with a notice that it should be kept in sync with new kernel
>>>>> versions.]
>>>>>
>>>>> According to this, it looks like we should maintain the local copy of
>>>>> the header file, until it is available.
>>>>> I also saw a similar approach in other selftests.
>>>>>
>>>>> So, for time being shall I create a local copy of ion.h ?
>>>>>
>>>>
>>>> Sorry. I am late in responding.
>>>>
>>>>>
>>>>>> Maybe something like that needs to happen here unless Shuah has
>>>>>> any better ideas for headers?
>>>>>>
>>>>
>>>> Since staging headers aren't included in the headers install for good
>>>> reasons, I have two suggestions:
>>>>
>>>> 1. Use bpf as an example:
>>>>
>>>> You will find a local include/uapi under bpf and the Makefile looks
>>>> there first for headers.
>>>>
>>>> Also, as Greg suggested, please add comments to indicate that this
>>>> header needs to be kept in sync with one from staging.
>>>>
>>>> This does make a copy of the header which isn't great.
>>>>
>>>> 2. Add a include line in the Makefile directly to point to the uapi
>>>>
>>>> drivers/staging/android/uapi
>>>>
>>>> The downside to this approach is if selftests are built outside the
>>>> tree, then that would be a problem. However, being able to build selft=
ests
>>>> outside the tree requires creating a tarball of the sources first. This
>>>> header could be added for that special case.
>>>>
>>>> I would recommend option 2 to go forward and if that doesn't work, we =
can
>>>> refine it.
>>>
>>> Thank you for your reply and suggestions.
>>> The option 2 is already present, if you see my Makefile.
>>> But this option does not work if built outside the kernel source tree.
>>> So, I am trying to maintain a local copy of ion.h
>>>
>>>
>>
>> So where does the test source reside for outside builds? Is this test ho=
sted
>> on GitHub?
>>
>> I am not opposed to the idea of a local copy. I am trying to understand =
the
>> outside env. that this test needs to be built? I am assuming ion test ge=
ts built
>> as an independent test and nor from kernel source tree?
>>
> =

> Sorry, I already pushed the local copy patch. I saw your reply later.
> But we can continue our discussion to find more proper solution.
> I really don't know about this test robot. I just got this build failure =
logs.
> I tried all cases within the kernel source including the kselftest_instal=
l.sh.
> =

> I guess, what this tests does is, create kernel_headers inside a
> folder, then copy all selftests also
> inside this folder and then fire the test one by one.
> But I really don't have any idea how it works.
> =


I think they might be pulling sources from kernel tree and compiling
outside the tree. This will only work when headers get installed.

In this case staging headers don't get installed and build fails.
kselftest_install.sh is for building and tar-balling the test programs
and shell scripts with other run-time dependencies. It is not for tar-balli=
ng
sources. Maybe it is something to consider doing.

> For me also, if I have to test my code outside kernel tree, I usually
> copy ion.h header file locally and test it.
> =

> But, still I have one question about staging tree kernel headers.
> How the kernel headers are created in case of Android where it uses
> the ion and other headers heavily?
> =


So this is a question for Greg KH? How do we handle staging headers?

We have couple of options here:

- add a staging header install as part of kselftest
- add a kselftest source tar-ball utility that covers the staging header
  dependencies.

I am reluctant to add a local ion.h. I would rather solve the bigger issue.
I think this might not be the only time we will run into this type of depen=
dency

thanks,
-- Shuah



--===============6199358426125376011==--

