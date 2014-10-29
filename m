Content-Type: multipart/mixed; boundary="===============1076805616114469562=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [PATCH] netdev: Fix sleeping inside wait event
Date: Wed, 29 Oct 2014 13:38:43 -0400
Message-ID: <20141029.133843.1944866828262153726.davem@davemloft.net>
In-Reply-To: <20141029173110.GE15602@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1076805616114469562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>
Date: Wed, 29 Oct 2014 18:31:10 +0100

> On Wed, Oct 29, 2014 at 06:13:45PM +0100, Peter Zijlstra wrote:
>> On Wed, Oct 29, 2014 at 09:29:55AM -0700, Cong Wang wrote:
>> > While you are on it, please fix rtnl_lock_unregistering_all() too?
>> =

>> Ah, that's hidden someplace else, sure I can do that. Thanks for
>> pointing it out.
> =

> Here goes..

For this as well:

Acked-by: David S. Miller <davem@davemloft.net>

--===============1076805616114469562==--

