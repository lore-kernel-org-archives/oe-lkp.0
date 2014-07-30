Content-Type: multipart/mixed; boundary="===============3182696084617656204=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@infradead.org>
To: lkp@lists.01.org
Subject: Re: [fs] BUG: unable to handle kernel NULL pointer dereference at 00000104
Date: Wed, 30 Jul 2014 07:49:18 -0700
Message-ID: <20140730144918.GA32728@infradead.org>
In-Reply-To: <20140730123933.GA7717@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3182696084617656204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 08:39:33PM +0800, Fengguang Wu wrote:
> It's from this git tree:
> =

> git://people.freedesktop.org/~dvdhrm/linux fops

David, please make sure things touching VFS code go through
linux-fsdevel and the proper trees.  In the current form this gets a
strong NAK.

--===============3182696084617656204==--

