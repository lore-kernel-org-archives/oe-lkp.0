Content-Type: multipart/mixed; boundary="===============3438843068212430899=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [staging] 68905a14e49: kernel BUG at drivers/base/driver.c:153!
Date: Sat, 08 Aug 2015 10:40:54 +0530
Message-ID: <20150808051054.GA10491@sudip-pc>
In-Reply-To: <20150807180113.GC10282@kroah.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3438843068212430899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2015 at 11:01:13AM -0700, Greg Kroah-Hartman wrote:
> On Fri, Aug 07, 2015 at 12:45:53PM +0530, Sudip Mukherjee wrote:
> > On Thu, Aug 06, 2015 at 07:28:12PM -0700, Greg Kroah-Hartman wrote:
> > > =

> > > =

> > > On Sat, Aug 01, 2015 at 01:12:05PM +0800, kernel test robot wrote:
> > <snip>
> > > > [   12.276231] RIP =

> > > > [   12.276231] RIP  [<ffffffff81b68e78>] driver_register+0xa8/0xe0
> > > >  [<ffffffff81b68e78>] driver_register+0xa8/0xe0
> > > > [   12.276231]  RSP <ffff8800001a3e30>
> > > > [   12.276231]  RSP <ffff8800001a3e30>
> > > > [   12.403330] ---[ end trace 075c805d53b02836 ]---
> > > > [   12.403330] ---[ end trace 075c805d53b02836 ]---
> > > =

> > > David, any ideas of what needs to be done to fix this?
> > =

> > Hi Greg,
> > I was having a quick look and it looks like visorchipset is not yet
> > initialised and the bus is not yet registered. If you remember we had a
> > loooong discussion in another thread "usb: ulpi: don't register drivers
> > if bus doesn't exist", I sent a proposed patch also. For your reference:
> > "http://www.spinics.net/lists/linux-usb/msg125368.html".
> > I think this one is the perfect example of that case here.
> =

> Great, then it needs to be fixed in the unisys driver code, like I said
> should be done for busses to prevent this type of issue :)
oops. then I have missed that mail. The last mail I have from you in
that thread said "I have some time on Saturday (very long plane ride),
where I'll take a look at this." , so I though that is still in your
todo list. Then I need to fix parport also, as that can also have this
same problem.

regards
sudip

--===============3438843068212430899==--

