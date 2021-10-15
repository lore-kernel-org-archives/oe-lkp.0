Content-Type: multipart/mixed; boundary="===============2296166186016772244=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Fri, 15 Oct 2021 10:20:56 +0800
Message-ID: <CALOAHbAyLQ-NkeyERjs=PbaRAC7Qf=BO4KeDWfMxcB2QCTOcRQ@mail.gmail.com>
In-Reply-To: <20211014221409.5da58a42@oasis.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============2296166186016772244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 10:14 AM Steven Rostedt <rostedt@goodmis.org> wro=
te:
>
> On Fri, 15 Oct 2021 10:05:56 +0800
> Yafang Shao <laoar.shao@gmail.com> wrote:
>
> > > I'd say we need a TASK_COMM_LEN_V1 to use in all the old hard-coded
> > > places.
> > >
> >
> > Sure, it will be easy to grep then.
>
> Just because I'm picky about my bikeshed colors...
>
>
> Perhaps have it called TASK_COMM_LEN_16 ?
>
> The reason being, I have no idea what "V1" is. Version 1? What's that
> mean? And now TASK_COMM_LEN can be either 16 or 24. Perhaps we can have
> it be:
>
> #define TASK_COMM_LEN_16        16
> #define TASK_COMM_LEN_24        24
>
> if CONFIG_BASE_SMALL
> #define TASK_COMM_LEN                   TASK_COMM_LEN_16
> #else
> #define TASK_COMM_LEN                   TASK_COMM_LEN_24
> #endif
>
> or call it TASK_COMM_LEN_SMALL and TASK_COMM_LEN_LARGE
>
> ??
>
> It's still "grepable"
>

Good idea.

It seems TASK_COMM_LEN_16  and TASK_COMM_LEN_24 are more clear.
I will do it as you suggested.

-- =

Thanks
Yafang
--===============2296166186016772244==--

