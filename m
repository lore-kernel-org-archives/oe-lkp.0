Content-Type: multipart/mixed; boundary="===============8151598292386404535=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [x86] 16f187a5f3: WARNING:at_arch/x86/mm/ioremap.c:#__ioremap_caller
Date: Mon, 30 Sep 2019 06:26:39 +0200
Message-ID: <20190930042639.GA28928@lst.de>
In-Reply-To: <20190929090221.GA17687@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8151598292386404535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Did the change really just cause a new warning or replace
ioremap_nocache with ioremap in the call trace and thus trigger
some old warning detection?
--===============8151598292386404535==--

