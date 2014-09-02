Content-Type: multipart/mixed; boundary="===============3855701084609417990=="
MIME-Version: 1.0
From: Christoph Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [percpu] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 02 Sep 2014 11:00:12 -0500
Message-ID: <alpine.DEB.2.11.1409021052400.10607@gentwo.org>
In-Reply-To: <20140902153403.GY5001@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3855701084609417990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Sep 2014, Paul E. McKenney wrote:

> Before this commit, raw_cpu_add_return() didn't build.  The commit
> didn't affect anything else.
>
> So I don't understand how anything could work before this commit and
> be broken after it.  Enlightenment?

Where is that raw_cpu_add_return statement?

grep does not match anything like that in kernel/rcu/*
and this_cpu_add_return is used extensively in the network subsystem for
statistics.

--===============3855701084609417990==--

