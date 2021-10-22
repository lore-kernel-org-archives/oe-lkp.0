Content-Type: multipart/mixed; boundary="===============1089485089002132050=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PM] bfcc1e67ff: kernel-selftests.breakpoints.step_after_suspend_test.fail
Date: Fri, 22 Oct 2021 16:00:31 +0200
Message-ID: <CAJZ5v0hiUMVpahuUyN3XryU+qx8wxonR+MBb489w1ReMWSzTjQ@mail.gmail.com>
In-Reply-To: <df8f421a-0deb-19c4-27f3-9d50bea1eee4@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1089485089002132050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 9:19 PM Florian Fainelli <f.fainelli@gmail.com> w=
rote:
>
> On 10/20/21 11:48 AM, Rafael J. Wysocki wrote:
> >   On Wed, Oct 20, 2021 at 8:17 PM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
> >>
> >> On 10/20/21 9:00 AM, Rafael J. Wysocki wrote:

[cut]

> >>>> With a newer kernel without my patch:
> >>>>
> >>>> # cat /sys/power/state
> >>>> freeze standby mem
> >>>> # cat /sys/power/mem_sleep
> >>>> s2idle shallow [deep]
> >>>
> >>> OK, so the "deep" and "shallow" suspend variants appear to be
> >>> supported.  What's the problem with advertising "mem" then?
> >>
> >> s2idle and shallow are, but deep is not.
> >
> > Why is it there in mem_sleep, then?  It should not be there if
> > valid_state() returns 'false' for it.
>
> The suspend_ops that is registered has a ->valid that will return false
> for the PM_SUSPEND_MEM case, yet we ignore that and we still populate
> valide_state[PM]

I guess you mean "we still populate pm_states[PM_SUSPEND_MEM]".
Otherwise I'm not sure what you mean. :-)

Yes, we do, but this doesn't explain why "deep" is present in
"mem_sleep" in that case, because mem_sleep_states[PM_SUSPEND_MEM] is
only populated by suspend_set_ops() and that does take ->valid() into
account.

> >
> > mem_sleep_states[PM_SUSPEND_MEM] is only set by suspend_set_ops() if
> > valid_state(PM_SUSPEND_MEM) is 'true'.
>
> That is true, but pm_states[PM_SUSPEND_MEM] was (before my patch that
> is) unconditionally present. And for the same reason that you expect
> user-space to find the string "mem" in /sys/power/state, we expected not
> to find it, if PM_SUSPEND_MEM is not supported.
>
> >
> >>>
> >>>> # cat /sys/power/
> >>>> mem_sleep          pm_freeze_timeout  pm_wakeup_irq      wakeup_count
> >>>> pm_async           pm_print_times     state
> >>>> pm_debug_messages  pm_test            suspend_stats/
> >>>>
> >>>>
> >>>>>
> >>>>>> I have a change pending for PSCI
> >>>>>> that will actually check that SYSTEM_SUSPEND is supported before
> >>>>>> unconditionally making use of it.
> >>>>>>
> >>>>>>>
> >>>>>>> What happens is that "mem" is a "pointer" to a secondary list of
> >>>>>>> possible states and that generally is "s2idle shallow deep" and if
> >>>>>>> s2idle is the only available option, it will be just "s2idle".
> >>>>>>>
> >>>>>>> This list is there in /sys/power/mem_sleep.
> >>>>>>>
> >>>>>>> It was done this way, because some variants of user space expect =
"mem"
> >>>>>>> to be always present and don't recognize "freeze" properly.
> >>>>>>>
> >>>>>>> Sorry for the confusion.
> >>>>>>
> >>>>>> So how do we all get our cookie here? Should we just slap an #ifnd=
ef
> >>>>>> CONFIG_ACPI in order to allow platforms that do not have "mem" to =
not
> >>>>>> have it?
> >>>>>
> >>>>> Certainly not.
> >>>>>
> >>>>> I've just hacked my test-bed system with ACPI so it does not regist=
er
> >>>>> any suspend_ops at all and I have "freeze mem disk" in
> >>>>> /sys/power/state and "s2idle" in /sys/power/mem_sleep.  Writing "me=
m"
> >>>>> to /sys/power/state causes s2idle to be carried out.
> >>>>>
> >>>>> Since this is the expected behavior, I'm not sure what the problem =
is.
> >>>>
> >>>> The problem is advertising "mem" in /sys/power/state when the state =
is
> >>>> not actually supported by the platform firmware here, whether that
> >>>> translates into the form of s2idle or not. It is not supported, and =
it
> >>>> should not be there IMHO.
> >>>
> >>> Well, it is there, because some user space expects it to be there on
> >>> systems supporting any kind of system-wide suspend, including s2idle.
> >>> Like it or not.
> >>
> >> But that was not the case before 406e79385f32 ("PM / sleep: System sle=
ep
> >> state selection interface rework") and clearly nobody complained about
> >> that, did they?
> >
> > Yes, it was and yes, they did.  Changes like that are not made without =
a reason.
> >
> >>>
> >>> If it is not there, the utilities in question assume that system-wide
> >>> suspend is not supported at all.
> >>
> >> What utilities do depend on that? That selftest that does not even che=
ck
> >> that "mem" is actually present in /sys/power/state and just fails its
> >> test if it is not, yes it's not great, but that can be fixed.
> >
> > Various GUI-based things like KDE, GNOME and similar plus the Chrome
> > user space IIRC.
>
> OK.
>
> >
> >>>
> >>>> I was late to the game in identifying that,
> >>>> but the 4.9 kernel makes sense to me.
> >>>>
> >>>> Similarly, if you take arch/powerpc/sysdev/fsl_pmc.c only
> >>>> PM_SUSPEND_STANDBY is valid, so advertising mem would be wrong if we
> >>>> don't look at what ->valid tells us.
> >>>
> >>> Again: "mem" appears in /sys/power/state if the system supports any
> >>> kind of system-wide suspend (because of the expectations of user space
> >>> mentioned above) and mem_sleep decides what it really means.
> >>>
> >>> And this is documented too (see Documentation/admin-guide/pm/sleep-st=
ates.html).
> >>
> >> The documentation just states that if the kernel supports *any* suspend
> >> state, then /sys/power/state will be present and likewise for
> >> /sys/power/mem_sleep, it does not say what the contents will be and th=
at
> >> "mem" would always be present in there.
> >
> > It doesn't say so directly, but it kind of wouldn't make sense to have
> > "mem_sleep" without "mem" in "state" and it implies that "mem_sleep"
> > is not empty if it is present.  Ergo "mem" is present in "state" if
> > "mem_sleep" is present which is the case if (at least) s2idle is
> > supported.  That is always the case if CONFIG_SUSPEND is set which
> > follows from the suspend-to-idle description.
> >
> > Anyway, I'm still not sure what the problem really is.  Commit
> > 406e79385f32 still allows user space to only trigger transitions to
> > s2idle and other states explicitly reported as valid by the platform.
> >
>
> The problem from my perspective is still that "mem" is present even with
> PM_SUSPEND_PM not being valid for the said platform, and this is just
> confusing my/our user-space here as well as our users.

The "mem" string in /sys/power/state simply doesn't correspond to
PM_SUSPEND_MEM now, but PM_SUSPEND_MEM is just a number it has never
been well defined which state exactly is to be represented by it
(except for the ACPI case, but that's irrelevant here).

You are effectively saying something like "if my suspend_ops->valid()
returns 'false' for PM_SUSPEND_MEM, then the "mem" string should not
be there in /sys/power/state", but I don't really see why this matters
to user space and how, so please explain that to me.  What does it do
differently depending on whether or not "mem" is present?

The only case in which it may matter that I can imagine is if some
functionality is lost when "mem" is present in /sys/power/state, but
quite frankly I have no idea what functionality that may be.

> This was not like
> that back in the 4.9 kernel, but it changed later, therefore it also
> constitutes an user-space regression from my angle.

The best I can offer as a remedy would be an explicit opt-out
mechanism, say in the form of a kernel command line option, for
systems that cannot cope with the new sysfs interface behavior, but I
need to be convinced that they really cannot cope with it.
--===============1089485089002132050==--

