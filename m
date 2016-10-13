Content-Type: multipart/mixed; boundary="===============6665435147837843458=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: OOM in v4.8
Date: Thu, 13 Oct 2016 08:34:16 +0200
Message-ID: <20161013063416.GD21678@dhcp22.suse.cz>
In-Reply-To: <519d7220-9750-7be7-436e-407d4dc95d67@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6665435147837843458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 13-10-16 14:23:54, Aaron Lu wrote:
> On 10/12/2016 04:24 PM, Aaron Lu wrote:
> > On 10/12/2016 04:00 PM, Michal Hocko wrote:
[...]
> >> And I am obviously blind because you have already tested with
> >> 101105b1717f which contains the Andrew patchbomb and so all the releva=
nt
> >> changes. Now that I am lookinig into your log for that kernel there
> >> doesn't seem to be any OOM killer invocation. There is only
> >> kern  :warn  : [  177.175954] perf: page allocation failure: order:2, =
mode:0x208c020(GFP_ATOMIC|__GFP_COMP|__GFP_ZERO)
> > =

> > Oh right, perf may fail but that shouldn't make the test be terminated.
> > I'll need to check why OOM is marked for that test.
> =

> There is a monitor in our test infrastructure that periodically checks
> dmesg for messages like "out of memory", "page allocation failure", etc.
> And if those messages are found, the test is believed not trustworthy
> and killed since most of our tests are performance related.
> =

> That is the reason why "perf page allocation failure" caused the test to
> be marked OOM. I tried to not start perf and with commit 101105b1717f,
> 10 tests finished without any OOM failures.

Thanks for double checking!
-- =

Michal Hocko
SUSE Labs

--===============6665435147837843458==--

