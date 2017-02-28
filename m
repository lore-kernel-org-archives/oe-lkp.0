Content-Type: multipart/mixed; boundary="===============6645318869738861124=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] f2a5fec173 EIP: __mutex_trylock
Date: Tue, 28 Feb 2017 08:53:33 +0000
Message-ID: <20170228085333.GF10304@nuc-i3427.alporthouse.com>
In-Reply-To: <20170228035924.hqckycv6at4sfzyc@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6645318869738861124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 11:59:24AM +0800, Fengguang Wu wrote:
> Hello,
> =

> Here is another bisect result with a different call trace.

Is this a single processor VM without pre-emption? It's a busy spin
loop, so relies on the other thread being run to break the loop. That
cpu_relax() should become cond_resched()?
-Chris


-- =

Chris Wilson, Intel Open Source Technology Centre

--===============6645318869738861124==--

