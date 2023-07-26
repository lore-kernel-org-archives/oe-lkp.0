Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75981BEEA
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 21:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D242DC433C7;
	Wed, 26 Jul 2023 21:39:21 +0000 (UTC)
Date: Wed, 26 Jul 2023 17:39:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: "shuah@kernel.org" <shuah@kernel.org>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, Ching-lin Yu <chinglinyu@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "lkp@intel.com" <lkp@intel.com>, Nadav Amit <namit@vmware.com>,
 "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, Alexey Makhalov
 <amakhalov@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "srivatsa@csail.mit.edu"
 <srivatsa@csail.mit.edu>, Tapas Kundu <tkundu@vmware.com>, Vasavi
 Sirnapalli <vsirnapalli@vmware.com>
Subject: Re: [PATCH v5 02/10] eventfs: Implement tracefs_inode_cache
Message-ID: <20230726173918.107908a3@rorschach.local.home>
In-Reply-To: <0FE7065F-6536-4311-AF41-4ABBD8E3ECF8@vmware.com>
References: <1690054625-31939-1-git-send-email-akaher@vmware.com>
	<1690054625-31939-3-git-send-email-akaher@vmware.com>
	<20230725190617.14c85997@rorschach.local.home>
	<0FE7065F-6536-4311-AF41-4ABBD8E3ECF8@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jul 2023 18:45:34 +0000
Ajay Kaher <akaher@vmware.com> wrote:

> Ok, I will move this to v6 04/10.
> Let me know once you will complete the review of v5.

OK, I finished my review. Mostly more nits. Hopefully v6 will be what I
pull into linux-next.

-- Steve
