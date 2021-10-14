Content-Type: multipart/mixed; boundary="===============1870814023321555026=="
MIME-Version: 1.0
From: Yafang Shao <laoar.shao@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched.h] 317419b91e: perf-sanity-tests.Parse_sched_tracepoints_fields.fail
Date: Thu, 14 Oct 2021 21:11:34 +0800
Message-ID: <CALOAHbBTxLvuiuT4tT2_7C+jaXBoh0uTjzLRm+njO4tKxCtPwg@mail.gmail.com>
In-Reply-To: <173454728.14036.1634216949862.JavaMail.zimbra@efficios.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1870814023321555026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 9:09 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Oct 14, 2021, at 9:05 AM, Yafang Shao laoar.shao(a)gmail.com wro=
te:
> [...]
> >> If it happens that this ABI break is noticed by more than an in-tree t=
est
> >> program, then
> >> the kernel's ABI rules will require that this trace field size stays u=
nchanged.
> >> This brings
> >> up once more the whole topic of "Tracepoints ABI" which has been discu=
ssed
> >> repeatedly in
> >> the past.
> >>
> >
> > I will check if any other in-tree tools depends on TASK_COMM_LEN.
>
> That's a start, but given this is a userspace ABI, out-of-tree userland
> tools which depend of this to be fixed-size are also relevant.
>

TASK_COMM_LEN isn't defined in include/uapi/ directory, so it seems
that it isn't the uerspace ABI?


-- =

Thanks
Yafang
--===============1870814023321555026==--

