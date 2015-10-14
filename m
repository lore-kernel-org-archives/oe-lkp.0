Content-Type: multipart/mixed; boundary="===============1990517099874086372=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: WARNING: CPU: 0 PID: 178 at lib/list_debug.c:27 __list_add()
Date: Wed, 14 Oct 2015 11:08:08 -0700
Message-ID: <CAPcyv4i6ObXAJ=BcvDYR50WP-u61W1NqDCfRf42t68kLA-3mww@mail.gmail.com>
In-Reply-To: <20151014095200.GB8371@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1990517099874086372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 2:52 AM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Dan,
>
> Here is a not easy to reproduce bug discovered by
>
> https://git.kernel.org/pub/scm/linux/kernel/git/djbw/nvdimm.git libnvdimm=
-pending
>
> commit e5cc3a1bcf4743eeb4049568f6605e5d16251834
> Author:     Dan Williams <dan.j.williams@intel.com>
> AuthorDate: Sat Sep 26 20:33:29 2015 -0400
> Commit:     Dan Williams <dan.j.williams@intel.com>
> CommitDate: Fri Oct 9 17:01:11 2015 -0400
>
>     list: introduce list_poison() and LIST_POISON3
>
>     ZONE_DEVICE pages always have an elevated count and will never be on =
an
>     lru reclaim list.  That space in 'struct page' can be redirected for
>     other uses, but for safety introduce a poison value that will always
>     trip __list_add() to assert.  This allows half of the struct list_head
>     storage to be reclaimed with some assurance to back up the assumption
>     that the page count never goes to zero and a list_add() is never
>     attempted.

Hmm, possibly LIST_POISON3 is not an unused value.  I'll try a
different approach.  Thanks!

--===============1990517099874086372==--

