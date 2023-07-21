Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44427F00
	for <oe-lkp@lists.linux.dev>; Fri, 21 Jul 2023 17:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE68C433C7;
	Fri, 21 Jul 2023 17:30:05 +0000 (UTC)
Date: Fri, 21 Jul 2023 13:30:00 -0400
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
Message-ID: <20230721133000.763cd3c3@gandalf.local.home>
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

> [ And =E2=80=9Cbool" is clearer type for is_freed. ]

Oh, and to answer why I didn't use bool. I want to make sure that it
doesn't use just part of the other elements in the union. If the compiler
decides to use one byte for the bool (which it is perfectly valid to do
so), and it happens to map over a zero of the other elements in the union,
then it will give a false negative.

By using unsigned long, it will be guaranteed to contain some content.

-- Steve
