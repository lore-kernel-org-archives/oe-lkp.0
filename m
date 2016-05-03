Content-Type: multipart/mixed; boundary="===============6205927702356350812=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: Extending the 0-day system with syzkaller?
Date: Tue, 03 May 2016 10:00:04 +0200
Message-ID: <CACT4Y+ZjNbAq4R78HWV1_ucFgTo1tf9TjAo1D=t+Cyo1UpukXw@mail.gmail.com>
In-Reply-To: <20160503040121.GA10930@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6205927702356350812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2016 at 6:01 AM, Fengguang Wu <fengguang.wu@intel.com> wro=
te:
>> One quick question is i recall an early discussion is that this enabling=
 requires new gcc,
>> is this still be true?
>
> I see Debian just upgraded its gcc packages to 6.1, which makes it
> more convenient for us to integrate with syzkaller.
>
> Since syzkaller is more about a client-server system than a hands on
> tool like trinity, it may need non-trivial modifications to 0-day and
> possibly syzkaller to achieve the integration. For example, syzkaller
> and 0-day each has its own way to run QEMU, which should be resolved
> somehow.
>
> Another question is, the 0-day model relies heavily on bisecting to
> cover the large number of kernel trees. If a bug cannot be easily
> reproduced and bisected, we don't know to whom it should be reported
> to. Trinity offers an option "-sN: use N as random seed." to help
> reproduce bugs it found. I wonder if syzkaller has similar mechanism
> to help with reproducing bugs it found?


Hi Fengguang,

Yes, syzkaller setup is more elaborate, but architecture is pretty
modular so I believe we can resolve these issues.

What does your infrastructure do? I guess it winds up qemu instances,
copies necessary binaries and then runs some command? How does it
monitor for crashes? By parsing console output? How do you control
duration of testing? By instructing trinity to do fixed number of
iterations, or by killing qemu?

Syzkaller already has a number of simpler tools. For example,
syz-stress works more or less like trinity -- you can copy it onto
test machine and instruct to run random programs. I can cook another
tool that will fit into your setup. One inherent complication, though,
is that syzkaller is stateful, it needs to accumulate corpus of
interesting programs (based on code coverage) to work more
efficiently. So we will need some way to save corpus from qemu
instances externally and then pass the corpus to new qemu instances.
But on the other hand, that was proven to be super efficient in
finding regressions -- namely, in 15 minutes it can test almost
everything that it discovered previously.

Re reproducers: syzkaller can do even better than trinity. Syzkaller
logs all executed programs to stdout (in default mode, or it can also
log to local files or kernel console). If you have the log with
programs that were executed before the crash, then it's possible (1)
to re-execute the log on other kernels, or (2) extract the guilty
program from the log, minimize it and convert to an executable C
program to present to developers
(https://github.com/google/syzkaller/wiki/Crash-reproducer-programs).
Based on my experience (2) is real game changer, developers much more
willing to fix bugs when they have a small reproducer.

--===============6205927702356350812==--

