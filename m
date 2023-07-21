Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647627F00
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 17:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FEDC433C7;
	Fri, 21 Jul 2023 17:24:55 +0000 (UTC)
Date: Fri, 21 Jul 2023 13:24:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ajay Kaher <akaher@vmware.com>, "shuah@kernel.org" <shuah@kernel.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>, Ching-lin Yu
 <chinglinyu@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, Alexey Makhalov
 <amakhalov@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "srivatsa@csail.mit.edu"
 <srivatsa@csail.mit.edu>, Tapas Kundu <tkundu@vmware.com>, Vasavi
 Sirnapalli <vsirnapalli@vmware.com>
Subject: Re: [PATCH v4 00/10] tracing: introducing eventfs
Message-ID: <20230721132454.07d6c8b2@gandalf.local.home>
In-Reply-To: <66DACCE8-1C57-4A30-8ACF-D88179CA6381@vmware.com>
References: <1689248004-8158-1-git-send-email-akaher@vmware.com>
	<20230714185824.62556254@gandalf.local.home>
	<883F9774-3E76-4346-9988-2788FAF0D55E@vmware.com>
	<20230718094005.32516161@gandalf.local.home>
	<2CD72098-08E2-4CAA-B74D-D8C44D318117@vmware.com>
	<20230719102310.552d3356@gandalf.local.home>
	<899D0823-A1B2-4A6F-A5BA-0D707F41C3D4@vmware.com>
	<20230719144046.746af82e@gandalf.local.home>
	<20230721084839.4a97a595@gandalf.local.home>
	<20230721091947.0df9fd73@gandalf.local.home>
	<66DACCE8-1C57-4A30-8ACF-D88179CA6381@vmware.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jul 2023 17:17:24 +0000
Nadav Amit <namit@vmware.com> wrote:


> > I also added a "is_freed" field that is part of the union and is set if
> > list elements have content. Note, since the union was criticized before=
, I
> > will state the entire purpose of doing this patch set is to save memory.
> > This structure will be used for every event file. What's the point of
> > getting rid of dentries if we are replacing it with something just as b=
ig?
> > Anyway, struct dentry does the exact same thing! =20
>=20
> Hey, don=E2=80=99t shoot me=E2=80=A6

 ;-)

>=20
> [And admittedly, I didn=E2=80=99t review the whole series after v1.]
>=20
> I understand your position, but I think that at least is_freed should not
> be in the union, and you can just put it after umode_t.
>=20
> Even for the matter of size, it should not matter in most architectures
> since umode_t is 16-bit, as natural alignment is at least 32-bits.

My new code I'm working on removes the umode_t and will require this then.
I rather have that part tested before adding other drastic changes.

-- Steve


>=20
> [ And =E2=80=9Cbool" is clearer type for is_freed. ]
>=20

