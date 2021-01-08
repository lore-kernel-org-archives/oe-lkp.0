Content-Type: multipart/mixed; boundary="===============0079638450399040222=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Fri, 08 Jan 2021 10:51:56 +0100
Message-ID: <X/grPFTgOMvtqEVZ@hirez.programming.kicks-ass.net>
In-Reply-To: <824461ae2cb642b1b2f82fac140a98da@AcuMS.aculab.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0079638450399040222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 09:37:45AM +0000, David Laight wrote:
> The lack of spinlocks in userspace really kills you.

Glibc has them, but please don't complain about lock holder preemption
issues if you do actually use them ;-)
--===============0079638450399040222==--

