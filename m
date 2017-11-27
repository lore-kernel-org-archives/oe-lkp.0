Content-Type: multipart/mixed; boundary="===============6585216162423656563=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: 2f47e7e19f ("x86/mm/kaiser: Use PCID feature to make user and .."): WARNING: CPU: 0 PID: 1 at mm/early_ioremap.c:114 __early_ioremap
Date: Mon, 27 Nov 2017 06:51:12 -0800
Message-ID: <a60acd2a-213c-c731-4ad0-e9fb77456f7e@linux.intel.com>
In-Reply-To: <20171127101814.jsglrh7typy3pxxp@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6585216162423656563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/2017 02:18 AM, Ingo Molnar wrote:
> Any ideas about this bug?

I suspect that it's not bisected perfectly.  I did some testing with
that config and it pretty much boots or crashes randomly.

Booting in a VM on a CPU without PCID support gets crashes in early
userspace, which has tended to be a TLB flushing problem.  I'll narrow
it down some more today.

--===============6585216162423656563==--

