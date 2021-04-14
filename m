Content-Type: multipart/mixed; boundary="===============0536794327453545005=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 10/16] mm: multigenerational lru: mm_struct list
Date: Wed, 14 Apr 2021 15:36:26 +0100
Message-ID: <20210414143626.GT2531743@casper.infradead.org>
In-Reply-To: <20210413065633.2782273-11-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0536794327453545005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 12:56:27AM -0600, Yu Zhao wrote:
> In order to scan page tables, we add an infrastructure to maintain
> either a system-wide mm_struct list or per-memcg mm_struct lists.
> Multiple threads can concurrently work on the same mm_struct list, and
> each of them will be given a different mm_struct.
> =

> This infrastructure also tracks whether an mm_struct is being used on
> any CPUs or has been used since the last time a worker looked at it.
> In other words, workers will not be given an mm_struct that belongs to
> a process that has been sleeping.

This seems like a great use for an allocating XArray.  You can use a
search mark to indicate whether it's been used since the last time a
worker looked at it.

--===============0536794327453545005==--

