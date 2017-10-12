Content-Type: multipart/mixed; boundary="===============7107693579524488201=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Thu, 12 Oct 2017 13:45:09 +0200
Message-ID: <20171012114509.qvmmep7vugsvdamw@hirez.programming.kicks-ass.net>
In-Reply-To: <20171012092813.wy6yqvmrqstwrkjn@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7107693579524488201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 05:28:13PM +0800, Fengguang Wu wrote:
> Please try this:
> =

> rm openwrt-trinity-i386.cgz
> wget https://github.com/fengguang/reproduce-kernel-bug/raw/master/openwrt=
/openwrt-trinity-i386.cgz

Yep, that makes it go. Thanks!

--===============7107693579524488201==--

