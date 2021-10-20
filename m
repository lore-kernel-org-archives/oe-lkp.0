Content-Type: multipart/mixed; boundary="===============8878684471652978795=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PM] bfcc1e67ff: kernel-selftests.breakpoints.step_after_suspend_test.fail
Date: Wed, 20 Oct 2021 15:49:25 +0200
Message-ID: <CAJZ5v0jmGWLfK7-7ULEVjzHtCr2wckK0TiY=59ud=hSM0x4hkA@mail.gmail.com>
In-Reply-To: <4300a3d4-76de-70c5-2a7b-c4d066ef5bc6@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8878684471652978795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 9:04 PM Florian Fainelli <f.fainelli@gmail.com> w=
rote:
>
> On 10/19/21 11:53 AM, Rafael J. Wysocki wrote:
> > On 10/15/2021 9:40 PM, Florian Fainelli wrote:
> >> On 10/15/21 11:45 AM, Rafael J. Wysocki wrote:
> >>> On 10/14/2021 11:55 PM, Florian Fainelli wrote:
> >>>> On 10/14/21 12:23 PM, Rafael J. Wysocki wrote:
> >>>>> On 10/14/2021 6:26 PM, Florian Fainelli wrote:
> >>>>>> On 10/14/21 12:57 AM, kernel test robot wrote:
> >>>>>>> Greeting,
> >>>>>>>
> >>>>>>> FYI, we noticed the following commit (built with gcc-9):
> >>>>>>>
> >>>>>>> commit: bfcc1e67ff1e4aa8bfe2ca57f99390fc284c799d ("PM: sleep: Do =
not
> >>>>>>> assume that "mem" is always present")
> >>>>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
> >>>>>>> master
> >>>>>>>
> >>>>>>>
> >>>>>>> in testcase: kernel-selftests
> >>>>>>> version: kernel-selftests-x86_64-c8c9111a-1_20210929
> >>>>>>> with following parameters:
> >>>>>>>
> >>>>>>>       group: group-00
> >>>>>>>       ucode: 0x11
> >>>>>>>
> >>>>>>> test-description: The kernel contains a set of "self tests" under
> >>>>>>> the
> >>>>>>> tools/testing/selftests/ directory. These are intended to be small
> >>>>>>> unit tests to exercise individual code paths in the kernel.
> >>>>>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> >>>>>>>
> >>>>>>>
> >>>>>>> on test machine: 288 threads 2 sockets Intel(R) Xeon Phi(TM) CPU
> >>>>>>> 7295
> >>>>>>> @ 1.50GHz with 80G memory
> >>>>>>>
> >>>>>>> caused below changes (please refer to attached dmesg/kmsg for ent=
ire
> >>>>>>> log/backtrace):
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> If you fix the issue, kindly add following tag
> >>>>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>>>>> Thanks for your report. Assuming that the code responsible for
> >>>>>> registering the suspend operations is drivers/acpi/sleep.c for your
> >>>>>> platform, and that acpi_sleep_suspend_setup() iterated over all
> >>>>>> possible
> >>>>>> sleep states, your platform must somehow be returning that
> >>>>>> ACPI_STATE_S3
> >>>>>> is not a supported state somehow?
> >>>>>>
> >>>>>> Rafael have you ever encountered something like that?
> >>>>> Yes, there are systems with ACPI that don't support S3.
> >>>> OK and do you know what happens when we enter suspend with "mem" in
> >>>> those cases? Do we immediately return because ultimately the firmware
> >>>> does not support ACPI S3?
> >>> "mem" should not be present in the list of available strings then, so=
 it
> >>> should be rejected right away.
> >> Well yes, that was the purpose of the patch I submitted, but assuming
> >> that we did provide "mem" as one of the possible standby modes even
> >> though that was wrong (before patch), and the test was trying to enter
> >> ACPI S3 standby, what would have happened, would the ACPI firmware hon=
or
> >> the request but return an error, or would it actually enter ACPI S3?
> >>
> >> In any case, I will change the test to check that this is a supported
> >> standby mode before trying it.
> >
> > Unfortunately, I will need to revert bfcc1e67ff1e4aa8bfe2, because it
> > breaks user space compatibility and that's got caught properly by the t=
est.
>
> Reverting my commit will break powerpc and other ARM/ARM64 platforms
> where mem is not supported (via PSCI),

It won't break anything, although the things that didn't work before
will still not work after it.

And "mem" is always supported even if there are no suspend_ops at all,
in which case it becomes an alternative way to trigger s2idle.

So, on the affected systems, what's there in /sys/power/?  Is
mem_sleep present?  If so, what's in it?

> I have a change pending for PSCI
> that will actually check that SYSTEM_SUSPEND is supported before
> unconditionally making use of it.
>
> >
> > What happens is that "mem" is a "pointer" to a secondary list of
> > possible states and that generally is "s2idle shallow deep" and if
> > s2idle is the only available option, it will be just "s2idle".
> >
> > This list is there in /sys/power/mem_sleep.
> >
> > It was done this way, because some variants of user space expect "mem"
> > to be always present and don't recognize "freeze" properly.
> >
> > Sorry for the confusion.
>
> So how do we all get our cookie here? Should we just slap an #ifndef
> CONFIG_ACPI in order to allow platforms that do not have "mem" to not
> have it?

Certainly not.

I've just hacked my test-bed system with ACPI so it does not register
any suspend_ops at all and I have "freeze mem disk" in
/sys/power/state and "s2idle" in /sys/power/mem_sleep.  Writing "mem"
to /sys/power/state causes s2idle to be carried out.

Since this is the expected behavior, I'm not sure what the problem is.
--===============8878684471652978795==--

