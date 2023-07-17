Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE02AD46
	for <oe-lkp@lists.linux.dev>; Mon, 17 Jul 2023 12:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2198C433C8;
	Mon, 17 Jul 2023 12:24:12 +0000 (UTC)
Date: Mon, 17 Jul 2023 08:24:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, "shuah@kernel.org"
 <shuah@kernel.org>, Ching-lin Yu <chinglinyu@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, Nadav Amit <namit@vmware.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, Alexey Makhalov
 <amakhalov@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "srivatsa@csail.mit.edu"
 <srivatsa@csail.mit.edu>, Tapas Kundu <tkundu@vmware.com>, Vasavi
 Sirnapalli <vsirnapalli@vmware.com>
Subject: Re: [PATCH v4 10/10] test: ftrace: Fix kprobe test for eventfs
Message-ID: <20230717082411.147abfa6@gandalf.local.home>
In-Reply-To: <54F18849-4C39-4F30-A3D7-969F14EA3810@vmware.com>
References: <1689248004-8158-1-git-send-email-akaher@vmware.com>
	<1689248004-8158-11-git-send-email-akaher@vmware.com>
	<20230713223758.31a1e391@rorschach.local.home>
	<20230714222705.bc38f83d857473656a45d441@kernel.org>
	<54F18849-4C39-4F30-A3D7-969F14EA3810@vmware.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Jul 2023 05:24:43 +0000
Ajay Kaher <akaher@vmware.com> wrote:

> >> As this patch as is will break when running on older kernels, I was
> >> wondering if we should do this instead?  
> > 
> > +1 since the latest kselftest is used also for checking the older
> > stable kernels, the test case has to check the environment and
> > change the parameter (or make it unsupported for new feature)
> > So below looks good to me.  
> 
> +1, many ftrace tests are unsupported in my setup and may few require
> changes, not sure. Does any auto job takes care of this?

You mean like some kernel CI? Not that I know of.

Shuah, do you run these selftests on older kernels to make sure they don't
fail just because the test is unsupported?

-- Steve
