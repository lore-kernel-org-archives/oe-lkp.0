Content-Type: multipart/mixed; boundary="===============8829215530634338949=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [fs] BUG: unable to handle kernel NULL pointer dereference at 00000104
Date: Wed, 30 Jul 2014 20:39:33 +0800
Message-ID: <20140730123933.GA7717@localhost>
In-Reply-To: <20140730111420.GA759@infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8829215530634338949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 04:14:20AM -0700, Christoph Hellwig wrote:
> On Wed, Jul 30, 2014 at 12:12:35PM +0800, Fengguang Wu wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> Where is this coming from?  Bloating struct file for device specific
> stuff really isn't acceptable anyway.

It's from this git tree:

git://people.freedesktop.org/~dvdhrm/linux fops

Thanks,
Fengguang

--===============8829215530634338949==--

