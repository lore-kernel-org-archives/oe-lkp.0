Content-Type: multipart/mixed; boundary="===============7178112378355682074=="
MIME-Version: 1.0
From: Christoph Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: unable to handle kernel NULL pointer dereference at 000000da
Date: Fri, 12 Sep 2014 19:20:01 +0000
Message-ID: <alpine.DEB.2.11.1409121413540.21514@gentwo.org>
In-Reply-To: <20140912190238.GJ4775@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7178112378355682074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Sep 2014, Paul E. McKenney wrote:

> So, I am not seeing this failure in my testing, but my best guess is
> that the problem is due to the fact that force_quiescent_state() is
> sometimes invoked with preemption enabled, which breaks __this_cpu_read()
> though perhaps with very low probability.  The common-case call (from
> __call_rcu_core()) -does- have preemption disabled, in fact, it has
> interrupts disabled.

How could __this_cpu_read() break in a way that would make a difference to
the code? There was no disabling/enabling of preemption before the patch
and there is nothing like that after the patch. If there was a race then
it still exists. The modification certainly cannot create a race.



--===============7178112378355682074==--

