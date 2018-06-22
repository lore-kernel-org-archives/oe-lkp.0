Content-Type: multipart/mixed; boundary="===============6921018986709142287=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 17:02:51 +0200
Message-ID: <20180622150251.GA12802@lst.de>
In-Reply-To: <20180622082752.GX11011@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6921018986709142287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Xiaolong,

can you retest this workload on the following branch:

    git://git.infradead.org/users/hch/vfs.git remove-get-poll-head

Gitweb:

    http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remove-g=
et-poll-head

--===============6921018986709142287==--

