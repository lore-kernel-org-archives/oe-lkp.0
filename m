Content-Type: multipart/mixed; boundary="===============5506017759738308812=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 17:28:50 +0200
Message-ID: <20180622152850.GA14366@lst.de>
In-Reply-To: <20180622151409.GA30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============5506017759738308812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 04:14:09PM +0100, Al Viro wrote:
> >     http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remo=
ve-get-poll-head
> =

> See objections upthread re "fs,net: move poll busy loop handling into a
> separate method"; as for the next one... I'd like an ACK from networking
> folks.  The rest of queue makes sense.

I want to see basic results first before micro-optimizing.  After that
I'll send it out to the net folks for feedback.

--===============5506017759738308812==--

