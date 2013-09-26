Content-Type: multipart/mixed; boundary="===============3177637864110506886=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 11:05:51 -0700
Message-ID: <20130926110551.52ad8156.akpm@linux-foundation.org>
In-Reply-To: <52447064.5030902@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3177637864110506886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Sep 2013 13:35:32 -0400 Peter Hurley <peter@hurleysoftware.com=
> wrote:

> The issue with a single large kmalloc is that it may fail where
> 3 separate, page-or-less kmallocs would not have.

Or vmalloc fails first, because of internal fragmentation of the vmap
arena.  This problem plus vmalloc's slowness are the reasons why
vmalloc should be avoided.

A tremendous number of places in the kernel perform higher-order
allocations nowadays.  The page allocator works damn hard to service
them and I expect that switching to kmalloc here will be OK.

--===============3177637864110506886==--

