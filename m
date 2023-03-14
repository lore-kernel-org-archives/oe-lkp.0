Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873023A0
	for <oe-lkp@lists.linux.dev>; Tue, 14 Mar 2023 05:57:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6E89868AA6; Tue, 14 Mar 2023 06:50:05 +0100 (CET)
Date: Tue, 14 Mar 2023 06:50:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <yujie.liu@intel.com>, Christoph Hellwig <hch@lst.de>,
	oe-lkp@lists.linux.dev, lkp@intel.com,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [linux-next:master] [mm] 480c454ff6:
 BUG:kernel_NULL_pointer_dereference
Message-ID: <20230314055005.GA24834@lst.de>
References: <202303140916.5e8e96b2-yujie.liu@intel.com> <20230313191931.f84776cb09dc8c4b50673a76@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313191931.f84776cb09dc8c4b50673a76@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Mar 13, 2023 at 07:19:31PM -0700, Andrew Morton wrote:
> Thanks, I expect this is fixed by

Yes, that should take care of it.
