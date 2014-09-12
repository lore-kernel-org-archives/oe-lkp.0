Content-Type: multipart/mixed; boundary="===============5875609459809415383=="
MIME-Version: 1.0
From: Pranith Kumar <bobby.prani@gmail.com>
To: lkp@lists.01.org
Subject: Re: [rcu] BUG: unable to handle kernel NULL pointer dereference at 000000da
Date: Fri, 12 Sep 2014 20:41:03 +0000
Message-ID: <CAJhHMCCevxQVctMtM83+_TN1PbcsQ9H_VaPOigv_OvZP32puYw@mail.gmail.com>
In-Reply-To: <20140912190238.GJ4775@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5875609459809415383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2014 at 3:02 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Mon, Sep 01, 2014 at 04:44:04PM +0800, Fengguang Wu wrote:
>> Greetings,
>>
>> 0day kernel testing robot got the below dmesg and the first bad commit is
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit d860d40327dde251d508a234fa00bd0d90fbb656
>> Author:     Shan Wei <davidshan@tencent.com>
>> AuthorDate: Thu Jun 19 14:12:44 2014 -0700
>> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> CommitDate: Wed Jul 9 09:15:21 2014 -0700
>
> Hearing nothing from Shan or Pranith...
>
> So, I am not seeing this failure in my testing, but my best guess is
> that the problem is due to the fact that force_quiescent_state() is
> sometimes invoked with preemption enabled, which breaks __this_cpu_read()
> though perhaps with very low probability.  The common-case call (from
> __call_rcu_core()) -does- have preemption disabled, in fact, it has
> interrupts disabled.
>> So unless I hear otherwise, I will simply revert this commit.

I missed this report as I was not CC'ed and this is the first time I
am seeing this. As Christoph said later in the thread, it really is
not clear how this change is triggering the bug.

The tracer testing triggers this bug which is a corrupt stack and we
see no force_quiescent_state() in the back trace. So may be this is
exposing a bug somewhere else? Not really sure how to look at this.

> [    0.420978] Testing tracer branch:
> [    0.421701] BUG: unable to handle kernel NULL pointer dereference at 0=
00000da
> [    0.422857] IP: [<c1061074>] update_curr+0x1a3/0x2c3
> [    0.423639] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
> [    0.424000] Thread overran stack, or stack corrupted

--===============5875609459809415383==--

