Content-Type: multipart/mixed; boundary="===============6059914663404871591=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [vfs] kernel BUG at fs/namei.c:1066!
Date: Thu, 29 Jan 2015 19:32:54 +0000
Message-ID: <4836.1422559974@warthog.procyon.org.uk>
In-Reply-To: <20150129182558.GA11745@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6059914663404871591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fengguang Wu <fengguang.wu@intel.com> wrote:

> commit 1bdc0d05755a7b261658f4d7b9d5e5a66773fa72
> Author:     David Howells <dhowells@redhat.com>
> AuthorDate: Wed Jan 28 11:56:45 2015 +0000
> Commit:     David Howells <dhowells@redhat.com>
> CommitDate: Wed Jan 28 12:06:23 2015 +0000
> =

>     VFS: Split DCACHE_FILE_TYPE into regular and special types

Yep, I just fixed this patch.

David

--===============6059914663404871591==--

