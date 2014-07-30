Content-Type: multipart/mixed; boundary="===============8280942539899659207=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [delayed_fput] BUG: unable to handle kernel paging request at ffff8800122a0ad0
Date: Wed, 30 Jul 2014 15:51:12 -0700
Message-ID: <alpine.DEB.2.02.1407301550140.26018@chino.kir.corp.google.com>
In-Reply-To: <20140730111521.GB759@infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8280942539899659207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jul 2014, Christoph Hellwig wrote:

> On Wed, Jul 30, 2014 at 11:55:41AM +0800, Fengguang Wu wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> How does this manage to trip over a 2 year old commit now?
> =


I think there's something weird going on with the testing of CONFIG_SLOB, =

same as http://permalink.gmane.org/gmane.linux.kernel/1759314 that =

identified a harmless commit that only initializes a field of
struct mm_struct and then ended up exploded in slob freeing.

--===============8280942539899659207==--

