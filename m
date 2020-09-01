Content-Type: multipart/mixed; boundary="===============3177168019601215594=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [fs] ef30fb3c60: kernel write not supported for file /sys/kernel/softlockup_panic
Date: Tue, 01 Sep 2020 09:08:41 +0200
Message-ID: <20200901070841.GA29847@lst.de>
In-Reply-To: <20200901064849.GI4299@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3177168019601215594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Looks like since the start of this series we've grown new code to
use kernel_write on sysctl files based on boot parameters.  The good
news is that this just means I need to resurrect the sysctl series
as all that work was done already.
--===============3177168019601215594==--

