Content-Type: multipart/mixed; boundary="===============7224323497899874630=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing/selftests] cfece71411: kernel-selftests.ftrace.event_trigger_-_test_inter-event_histogram_trigger_onchange_action.fail
Date: Fri, 29 Oct 2021 09:10:53 -0400
Message-ID: <20211029091053.18cc2c25@gandalf.local.home>
In-Reply-To: <20211029210056.6cd7796aea59cec3e9c1d7da@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7224323497899874630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Oct 2021 21:00:56 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> > # # of passed:  85
> > # # of failed:  26
> > # # of unresolved:  1
> > # # of untested:  0
> > # # of unsupported:  0
> > # # of xfailed:  1
> > # # of undefined(test bug):  0
> > not ok 1 selftests: ftrace: ftracetest # exit=3D1  =

> =

> Also, please configure your running environment correctly so that all
> ftracetest passes. If you unsure how to do, please ask me.

Although I think it's good to test with different configurations, where not
all tests pass. Because then there's times when a test will fail when it
should have been ignored, and that will let us know that there's a bug in
the test.

Or, different configurations might make a test fail that should have
passed, where a missing dependency was made.

I had someone report a bug that I never caught because it only happened
when something was configured off, and because I tested with everything on,
I never hit that bug.

-- Steve
--===============7224323497899874630==--

