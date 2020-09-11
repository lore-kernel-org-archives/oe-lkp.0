Content-Type: multipart/mixed; boundary="===============0060465920357772014=="
MIME-Version: 1.0
From: Martin Doucha <mdoucha@suse.cz>
To: lkp@lists.01.org
Subject: Re: [LTP] [PATCH] syscalls/ptrace10: Add new regression test
Date: Fri, 11 Sep 2020 17:13:43 +0200
Message-ID: <6d9b6e46-8337-9614-8fd7-b6ada8fcbe13@suse.cz>
In-Reply-To: <20200904180030.14838-1-chrubis@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0060465920357772014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
the code looks good, though it might make sense to simply integrate the
check into ptrace08. Just 6 extra lines in the existing test should
achieve the same coverage.

It also seems the bug existed long before the CVE 2018-1000199 fix
because the test fails on vulnerable kernels as well.

Anyway, if you prefer to keep the patch as is:

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 04. 09. 20 20:00, Cyril Hrubis wrote:
> New regression test for a kernel commit:
> =

> commit bd14406b78e6daa1ea3c1673bda1ffc9efdeead0
> Author: Jiri Olsa <jolsa@kernel.org>
> Date:   Mon Aug 27 11:12:25 2018 +0200
> =

>     perf/hw_breakpoint: Modify breakpoint even if the new attr has disabl=
ed set
> =

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Andy Lutomirski <luto@kernel.org>
> CC: Peter Zijlstra <peterz@infradead.org>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Alexandre Chartre <alexandre.chartre@oracle.com>
> ---


-- =

Martin Doucha   mdoucha(a)suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic
--===============0060465920357772014==--

