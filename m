Content-Type: multipart/mixed; boundary="===============0006481573578960231=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: dad4f140ed [ 7.709376] WARNING:suspicious_RCU_usage
Date: Mon, 19 Nov 2018 06:39:18 -0800
Message-ID: <20181119143918.GB394@bombadil.infradead.org>
In-Reply-To: <20181119011904.GE7861@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0006481573578960231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 05:19:04PM -0800, Matthew Wilcox wrote:
> On Mon, Nov 19, 2018 at 09:08:20AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> Umm.  I don't see a 'suspicious RCU usage' message in here.  I see a
> lot of vmalloc warnings ... ?

Never mind, the RCU warnings were in one of the attached dmesg files.
I found the problem; it's in the test-suite and not something that could
lead to any real problems today.

Thanks for the report!

--===============0006481573578960231==--

