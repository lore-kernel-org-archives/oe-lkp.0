Content-Type: multipart/mixed; boundary="===============6699003592868104651=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Thu, 02 Jun 2016 17:29:56 +0100
Message-ID: <20160602162956.GH14480@ZenIV.linux.org.uk>
In-Reply-To: <87h9dchzor.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6699003592868104651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 02:28:36PM +0800, Huang, Ying wrote:
> "Huang, Ying" <ying.huang@intel.com> writes:

> Here is the comparison result with perf profile information.  You can
> find it via searching 'perf-profile'.
[snip]

Looks like this load is hitting the arseloads of contention cases of
spin_lock() on various ->d_lock inside dcache_readdir().  With exclusive
lock on directory most of them end up uncontended...

I'll try to see what can be done there; quite a bit of those are actually
due to moving the cursor on every step.  I wonder if we could do the list
traversals with something less drastic - the real contents changes are
prevented by the shared lock on directory being held, after all...

I'll play with that and post when I get somewhere with it...

--===============6699003592868104651==--

