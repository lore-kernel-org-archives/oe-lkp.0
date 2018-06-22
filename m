Content-Type: multipart/mixed; boundary="===============4357631050984539817=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 16:14:09 +0100
Message-ID: <20180622151409.GA30522@ZenIV.linux.org.uk>
In-Reply-To: <20180622150251.GA12802@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4357631050984539817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 05:02:51PM +0200, Christoph Hellwig wrote:
> Hi Xiaolong,
> =

> can you retest this workload on the following branch:
> =

>     git://git.infradead.org/users/hch/vfs.git remove-get-poll-head
> =

> Gitweb:
> =

>     http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remove=
-get-poll-head

See objections upthread re "fs,net: move poll busy loop handling into a
separate method"; as for the next one... I'd like an ACK from networking
folks.  The rest of queue makes sense.

--===============4357631050984539817==--

