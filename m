Content-Type: multipart/mixed; boundary="===============1498871140183705415=="
MIME-Version: 1.0
From: Michel Lespinasse <michel@lespinasse.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Sun, 18 Apr 2021 06:48:45 +0000
Message-ID: <20210415095708.GA6874@lespinasse.org>
In-Reply-To: <CAOUHufaAz72+0HJu=XPv-6T8rUAdYo_mb5=H+yF3=LfwoufeYg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1498871140183705415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 01:13:13AM -0600, Yu Zhao wrote:
> Page table scanning doesn't replace the existing rmap walk. It is
> complementary and only happens when it is likely that most of the
> pages on a system under pressure have been referenced, i.e., out of
> *inactive* pages, by definition of the existing implementation. Under
> such a condition, scanning *active* pages one by one with the rmap is
> likely to cost more than scanning them all at once via page tables.
> When we evict *inactive* pages, we still use the rmap and share a
> common path with the existing code.
> =

> Page table scanning falls back to the rmap walk if the page tables of
> a process are apparently sparse, i.e., rss < size of the page tables.

Could you expand a bit more as to how page table scanning and rmap
scanning coexist ? Say, there is some memory pressure and you want to
identify good candidate pages to recaim. You could scan processes with
the page table scanning method, or you could scan the lru list through
the rmap method. How do you mix the two - when you use the lru/rmap
method, won't you encounter both pages that are mapped in "dense"
processes where scanning page tables would have been better, and pages
that are mapped in "sparse" processes where you are happy to be using
rmap, and even pges that are mapped into both types of processes at
once ?  Or, can you change the lru/rmap scan so that it will efficiently
skip over all dense processes when you use it ?

Thanks,

--
Michel "walken" Lespinasse
--===============1498871140183705415==--

