Content-Type: multipart/mixed; boundary="===============4943204556260691465=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [hw_breakpoint] WARNING: at kernel/trace/trace_kprobe.c:1393 kprobe_trace_self_tests_init()
Date: Wed, 01 Oct 2014 14:57:57 +0800
Message-ID: <20141001065757.GA17297@wfg-t540p.sh.intel.com>
In-Reply-To: <20140930175844.GA20922@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4943204556260691465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oleg,

> > +----------------------------------------------------------------------=
-+------------+------------+------------------+
> > |                                                                      =
 | 003002e04e | 8b4d801b2b | v3.17-rc7_093000 |
> > +----------------------------------------------------------------------=
-+------------+------------+------------------+
> > | boot_successes                                                       =
 | 60         | 0          | 0                |
> > | boot_failures                                                        =
 | 0          | 20         | 11               |
> > | WARNING:at_kernel/trace/trace_kprobe.c:kprobe_trace_self_tests_init()=
 | 0          | 20         | 11               |
> > | backtrace:kprobe_trace_self_tests_init                               =
 | 0          | 20         | 11               |
> > | backtrace:warn_slowpath_null                                         =
 | 0          | 20         | 11               |
> > | backtrace:kernel_init_freeable                                       =
 | 0          | 20         | 11               |
> > +----------------------------------------------------------------------=
-+------------+------------+------------------+
> >
> > [    4.188679] Testing kprobe tracing:
> > [    4.189810] Could not insert probe at kprobe_trace_selftest_target+0=
: -22
> =

> __register_trace_kprobe() fails.
> =

> No, I am very sure this can't be caused by the commit above. If nothing e=
lse,
> task_bp_pinned() changed by this commit is not even called in this case.

Sorry it is a bad bisect -- debug shows that CONFIG_FTRACE_STARTUP_TEST
is not enabled at all in the parent commit, which makes it boot success.
I'll fix this issue in my script and make the bisect stable.

Thanks,
Fengguang

--===============4943204556260691465==--

